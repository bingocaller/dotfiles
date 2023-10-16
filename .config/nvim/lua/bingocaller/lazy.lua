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
	-- The colorscheme should be available when starting Neovim
	{
		"catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{ "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

	-- LSP setup via LSP Zero
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = false,
	},
	{
		-- LSP Support
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		}
	},
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' }
		},
	},

	{
		-- rust-tools is not provided by Mason
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
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
	{
		-- Neovim plugin to improve the default vim.ui interfaces
		'stevearc/dressing.nvim',
		lazy = false,
	},

	-- Sort things using a motion
	{ "christoomey/vim-sort-motion", lazy = false },
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
	{ "lewis6991/gitsigns.nvim",     lazy = false },
	-- Switch things around using `cx`
	{ "tommcdo/vim-exchange",        lazy = false },
	-- Abbreviation, Substitustion, Coercion
	{ "tpope/vim-abolish",           lazy = false },
	-- Toggle comments
	{ "tpope/vim-commentary",        lazy = false },
	-- Git & Hub
	{ "tpope/vim-fugitive",          lazy = false },
	{ "tpope/vim-rhubarb",           lazy = false },
	-- Enable repeating lots more stuff
	{ "tpope/vim-repeat",            lazy = false },
	-- Surround stuff with other stuff
	{ "tpope/vim-surround",          lazy = false },
	-- Lots of mappings
	{ "tpope/vim-unimpaired",        lazy = false },
	{
		-- Split/join blocks of code
		'Wansmer/treesj',
		keys = { '<leader>m', '<leader>j', '<leader>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesj').setup()
		end,
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
}, {
	defaults = {
		lazy = true,
	},
})
