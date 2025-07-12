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
}
