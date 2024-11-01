return {
	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha",
		},
	},
	-- Source: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua
	-- It has to be replicated because passing a function to opts will not be
	-- merged with the existing configuration.
	{
		"nvimdev/dashboard-nvim",
		lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
		opts = function()
			local logo = [[
 ░░░    ░░ ░░░░░░░  ░░░░░░  ░░    ░░ ░░ ░░░    ░░░
 ▒▒▒▒   ▒▒ ▒▒      ▒▒    ▒▒ ▒▒    ▒▒ ▒▒ ▒▒▒▒  ▒▒▒▒
 ▒▒ ▒▒  ▒▒ ▒▒▒▒▒   ▒▒    ▒▒ ▒▒    ▒▒ ▒▒ ▒▒ ▒▒▒▒ ▒▒
 ▓▓  ▓▓ ▓▓ ▓▓      ▓▓    ▓▓  ▓▓  ▓▓  ▓▓ ▓▓  ▓▓  ▓▓
 ██   ████ ███████  ██████    ████   ██ ██      ██
     ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					-- stylua: ignore
					center = {
						{ action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
						{ action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
						{ action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
						{ action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
						{ action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
						{ action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
						{ action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
						{ action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
						{ action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
					},
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded "
								.. stats.loaded
								.. "/"
								.. stats.count
								.. " plugins in "
								.. ms
								.. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- open dashboard after closing lazy
			if vim.o.filetype == "lazy" then
				vim.api.nvim_create_autocmd("WinClosed", {
					pattern = tostring(vim.api.nvim_get_current_win()),
					once = true,
					callback = function()
						vim.schedule(function()
							vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
						end)
					end,
				})
			end

			return opts
		end,
	},
	{
		"neovim/nvim-lspconfig",
		init = function()
			-- Customizing LSP Keymaps
			-- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- disable <C-k> in insert mode (“Hover” symbol)
			keys[#keys + 1] = { "<C-k>", mode = { "i" }, false }
		end,
		opts = {
			-- Enable this to enable the builtin LSP code lenses on Neovim >=
			-- 0.10.0
			-- Be aware that you also will need to properly configure your LSP
			-- server to provide the code lenses.
			-- codelens = {
			-- 	enabled = true,
			-- },
			servers = {
				stylelint_lsp = {
					cssInJs = true,
					filetypes = {
						"css",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"sugarss",
						"typescriptreact",
						"vue",
						"wxss",
					},
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with
			-- lspconfig
			-- setup = {
			-- 	-- example to setup with typescript.nvim
			-- 	-- tsserver = function(_, opts)
			-- 	--   require("typescript").setup({ server = opts })
			-- 	--   return true
			-- 	-- end,
			-- 	-- Specify * to use this function as a fallback for any server
			-- 	-- ["*"] = function(server, opts) end,
			--
			-- 	-- Disable tsserver (typescript-language-server) in favour of
			-- 	-- typescript-tools
			-- 	tsserver = function()
			-- 		return true
			-- 	end,
			-- },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#auto-close-on-open-file
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			window = {
				position = "right",
				width = "30%",
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				component_separators = "│",
				section_separators = "",
			},
			sections = {
				lualine_b = {
					{
						"branch",
						icon = "",
					},
				},
				lualine_z = {
					"os.date('%R')",
				},
			},
		},
	},

	-- Disabled for now, since neotest-jest is causing problems.
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	opts = {
	-- 		-- Can be a list of adapters like what neotest expects, or a list of
	-- 		-- adapter names, or a table of adapter names, mapped to adapter
	-- 		-- configs. The adapter will then be automatically loaded with the
	-- 		-- config.
	-- 		adapters = {
	-- 			"neotest-playwright",
	-- 			-- ["neotest-playwright"] = {
	-- 			-- 	options = {
	-- 			-- 		enable_dynamic_test_discovery = true,
	-- 			-- 	},
	-- 			-- },
	-- 			"neotest-jest",
	-- 			-- ["neotest-jest"] = {
	-- 			-- 	jestCommand = require("neotest-jest.jest-util").getJestCommand(
	-- 			-- 		vim.fn.expand("%:p:h")
	-- 			-- 	),
	-- 			-- 	jestConfigFile = "jest.config.ts",
	-- 			-- 	-- env = { CI = true },
	-- 			-- 	cwd = function(path)
	-- 			-- 		return vim.fn.getcwd()
	-- 			-- 	end,
	-- 			-- },
	-- 		},
	-- 	},
	-- },

	-- -- add more treesitter parsers
	-- {
	--   "nvim-treesitter/nvim-treesitter",
	--   opts = {
	--     ensure_installed = {
	--       "bash",
	--       "html",
	--       "javascript",
	--       "json",
	--       "lua",
	--       "markdown",
	--       "markdown_inline",
	--       "python",
	--       "query",
	--       "regex",
	--       "tsx",
	--       "typescript",
	--       "vim",
	--       "yaml",
	--     },
	--   },
	-- },
	--
	-- -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the
	-- -- code above would overwrite `ensure_installed` with the new value.
	-- -- If you'd rather extend the default config, use the code below instead:
	-- {
	--   "nvim-treesitter/nvim-treesitter",
	--   opts = function(_, opts)
	--     -- add tsx and treesitter
	--     vim.list_extend(opts.ensure_installed, {
	--       "tsx",
	--       "typescript",
	--     })
	--   end,
	-- },
	--
	-- -- add jsonls and schemastore packages, and setup treesitter for json, json5
	-- -- and jsonc
	-- { import = "lazyvim.plugins.extras.lang.json" },
	--
	-- -- add any tools you want to have installed below
	-- {
	--   "williamboman/mason.nvim",
	--   opts = {
	--     ensure_installed = {
	--       "stylua",
	--       "shellcheck",
	--       "shfmt",
	--       "flake8",
	--     },
	--   },
	-- },
}
