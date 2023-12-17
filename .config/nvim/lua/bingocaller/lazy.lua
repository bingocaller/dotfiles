local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- The colour scheme should be available when starting Neovim
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- LSP setup via LSP Zero
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = false,
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			-- Installer for LSPs
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			{
				-- Autocompletion
				'hrsh7th/nvim-cmp',
				dependencies = {
					{
						"f3fora/cmp-spell",
						"hrsh7th/cmp-buffer",
						"hrsh7th/cmp-cmdline",
						"hrsh7th/cmp-nvim-lsp",
						"hrsh7th/cmp-path",
						"L3MON4D3/LuaSnip",
						"saadparwaiz1/cmp_luasnip",
						"rafamadriz/friendly-snippets",
					}
				},
			},
		}
	},

	{
		-- rust-tools is not provided by Mason
		"simrat39/rust-tools.nvim",
		ft = "rust",
		config = true,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			-- "mfussenegger/nvim-dap", -- Not currently used
		},
	},

	-- TypeScript stuff
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "typescript", "typescriptreact" },
		-- Will implicitly call require(MAIN).setup({})
		-- See `opts`/`config` here:
		-- https://github.com/folke/lazy.nvim#-plugin-spec
		opts = {},
	},
	{
		-- Automatically close TSX tags
		"windwp/nvim-ts-autotag",
		ft = { "typescript", "typescriptreact" },
		config = true,
	},
	{
		-- Makes TSX comments actually work
		"JoosepAlviste/nvim-ts-context-commentstring",
		ft = { "typescript", "typescriptreact" },
		config = true,
	},

	{
		-- File explorer
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		-- Telescope
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			-- Extensions
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},
	-- Improve the default vim.ui interfaces
	'stevearc/dressing.nvim',

	-- Sort things using a motion
	{
		"christoomey/vim-sort-motion",
		keys = 'gs',
	},
	{
		-- Better quickfix
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
	},
	-- Show VCS info in gutter and more
	"lewis6991/gitsigns.nvim",
	{
		-- Switch things around using `cx`
		"tommcdo/vim-exchange",
		keys = 'cx',
	},
	-- Abbreviation, Substitution, Coercion
	"tpope/vim-abolish",
	{
		-- Toggle comments
		"tpope/vim-commentary",
		keys = 'gc',
	},
	-- Git & Hub
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- Enable repeating lots more stuff
	"tpope/vim-repeat",
	-- Surround stuff with other stuff
	{
		"tpope/vim-surround",
		keys = { 'cs', 'ds', 'ys', 'S' },
	},
	-- Lots of mappings
	"tpope/vim-unimpaired",
	{
		-- Split/join blocks of code
		'Wansmer/treesj',
		keys = { '<leader>m', '<leader>j', '<leader>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
	},

	-- Tools for writing
	-- Zettelkasten functionality. Ties into `zk` binary/language server
	"mickael-menu/zk-nvim",
	-- Focus mode, Neovim-optimised
	"folke/zen-mode.nvim",
	{
		-- Markdown batteries
		"ixru/nvim-markdown",
		ft = "markdown",
	},
	{
		-- Markdown Preview server
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
