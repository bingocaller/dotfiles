return {
	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha",
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					-- Notice the extra beginning line breaks and no-break
					-- spaces. These are necessary for proper alignment of
					-- characters.
					header = [[


  ▄▄▄                            ▄▄▄     ▄▄▄                
█████                         ▀█████  ▀█████                
  ███                            ███     ███                
  ███▄███████▄     ▄▄█▀▀▀▀█▄▄    ███     ███   ▄▄██▀▀▀▀██▄▄ 
  ███▀     ▀███  ▄██▀      ███   ███     ███  ███▀      ▀███
  ███       ███  ███▀▀▀▀▀▀▀▀▀▀   ███     ███  ███        ███
  ███       ███  ███▄       ▄▄   ███     ███  ███▄      ▄███
██████     █████▄ ▀▀████████▀▀ ▄██████ ▄█████▄ ▀▀████████▀▀ ]],
				},
			},
		},
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
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				-- Conform will run the first available formatter
				javascript = {
					"eslint_d",
					"eslint",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			---@class snacks.zen.Config
			zen = {
				-- You can add any `Snacks.toggle` id here.
				-- Toggle state is restored when the window is closed.
				-- Toggle config options are NOT merged.
				---@type snacks.toggle.Config
				toggles = {
					diagnostics = false,
					dim = false,
					git_signs = false,
					inlay_hints = false,
					line_numbers = false,
					mini_diff_signs = false,
					words = false,
					wrap = true,
				},
				---@type snacks.win.Config
				win = {
					enter = true,
					fixbuf = true,
					minimal = true,
					relative = "editor",
					width = 80,
					height = 0,
					backdrop = {
						bg = require("catppuccin.palettes").get_palette(
							"mocha"
						).base,
						transparent = false,
					},
					keys = { q = false },
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
