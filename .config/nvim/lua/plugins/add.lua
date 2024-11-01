return {
	-- Editing text
	{
		-- Sort things using a motion
		"christoomey/vim-sort-motion",
		keys = "gs",
	},
	{
		-- Switch things around using `cx`
		"tommcdo/vim-exchange",
		keys = {
			"cx",
			{ mode = "v", "cx" },
		},
	},
	{
		-- Abbreviation, Substitution, Coercion
		"tpope/vim-abolish",
		event = { "LazyFile", "VeryLazy" },
	},
	{
		-- Enable repeating lots more stuff
		"tpope/vim-repeat",
		keys = ".",
	},
	{
		-- Surround stuff with other stuff
		"tpope/vim-surround",
		keys = {
			"cs",
			"ds",
			"ys",
			{ mode = "v", "S" },
		},
	},
	{
		-- Lots of mappings
		"tpope/vim-unimpaired",
		event = { "LazyFile", "VeryLazy" },
	},
	{
		-- Split/join blocks of code
		"Wansmer/treesj",
		keys = { "<leader>m", "<leader>j", "<leader>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
			langs = LazyVim.has("treesj")
					and {
						svg = require("treesj.langs.utils").merge_preset(
							require("treesj.langs.html"),
							{}
						),
						xml = require("treesj.langs.utils").merge_preset(
							require("treesj.langs.html"),
							{}
						),
					}
				or {},
		},
	},

	-- Big file handling
	{
		"LunarVim/bigfile.nvim",
		opts = {
			filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
		},
	},

	-- Git & Hub
	-- {
	-- 	-- Edit and review GitHub issues and pull requests
	-- 	"pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		-- OR 'ibhagwan/fzf-lua',
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	cmd = "Octo",
	-- 	opts = {
	-- 		default_merge_method = "squash",
	-- 	},
	-- },
	{
		"tpope/vim-fugitive",
		cmd = "G",
	},
	{
		"tpope/vim-rhubarb",
		cmd = "GBrowse",
	},

	-- Tools for writing
	{
		-- Markdown batteries
		"ixru/nvim-markdown",
		ft = "markdown",
	},
	{
		-- Used for Markdown preview (instead of markdown-preview.nvim, which
		-- stopped working recently and seems unmaintained at the moment).
		"jannis-baum/vivify.vim",
	},
	{
		-- Focus mode, Neovim-optimised
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = {
				backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 80, -- width of the Zen window
				-- height = 1, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = "0", -- disable fold column
					list = true, -- enable whitespace characters
				},
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
				},
				gitsigns = { enabled = false }, -- disables git signs
			},
		},
	},
	{
		-- Zettelkasten functionality. Ties into `zk` binary/language server
		"mickael-menu/zk-nvim",
		ft = "markdown",
	},

	-- TypeScript stuff
	-- {
	-- 	-- Alternative to tsserver
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	ft = {
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 	},
	-- 	opts = {
	-- 		complete_function_calls = true,
	-- 		code_lens = "all",
	-- 	},
	-- },
	{
		-- TypeScript type-checking on demand
		"dmmulroy/tsc.nvim",
		ft = {
			"typescript",
			"typescriptreact",
		},
		opts = {
			use_trouble_qflist = true,
		},
	},
}
