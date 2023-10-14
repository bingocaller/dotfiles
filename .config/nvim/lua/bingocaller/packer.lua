local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- LSP setup via LSP Zero
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			"neovim/nvim-lspconfig", -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			"williamboman/mason-lspconfig.nvim", -- Optional

			-- null-ls
			"jose-elias-alvarez/null-ls.nvim",
			"jay-babu/mason-null-ls.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp", -- Required
			"hrsh7th/cmp-nvim-lsp", -- Required
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",

			-- Snippets
			"L3MON4D3/LuaSnip", -- Required
			-- Snippet Collection (Optional)
			"rafamadriz/friendly-snippets",
		},
	})
	-- rust-tools is not provided by Mason
	use({
		"simrat39/rust-tools.nvim", -- completion
		requires = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	})

	use("jose-elias-alvarez/typescript.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({
		"windwp/nvim-ts-autotag",
		ft = { "typescript", "typescriptreact" },
	}) -- automatically close jsx tags
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		ft = { "typescript", "typescriptreact" },
	}) -- makes jsx comments actually work

	-- Custom text objects
	use("wellle/targets.vim") -- many useful additional text objects
	use({
		"kana/vim-textobj-user",
		{
			"jasonlong/vim-textobj-css", -- av/iv for variable segment
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",

			-- Extensions
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-github.nvim",
			"nvim-lua/popup.nvim", -- required by telescope-zoxide
			"jvgrootveld/telescope-zoxide",
		},
	})
	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- Status line
	use({
		"nvim-lualine/lualine.nvim", -- status line
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- Utilities and niceness

	-- Show git info in gutter and more
	-- use("airblade/vim-gitgutter")
	use("lewis6991/gitsigns.nvim")
	-- Sort things using a motion
	use("christoomey/vim-sort-motion")
	-- Better quickfix
	use({
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		requires = {
			{
				"junegunn/fzf",
				run = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
	})
	-- Switch things around using `cx`
	use("tommcdo/vim-exchange")
	-- Abbreviation, Substitustion, Coercion
	use("tpope/vim-abolish")
	-- Toggle comments
	use("tpope/vim-commentary")
	-- Enable repeating lots more stuff
	use("tpope/vim-repeat")
	-- Surround stuff with other stuff
	use("tpope/vim-surround")
	-- Lots of mappings
	use("tpope/vim-unimpaired")

	-- Cheatsheet
	--
	use({
		"sudormrfbin/cheatsheet.nvim",
		opt = true,
		cmd = "Cheatsheet",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- Tools for writing
	-- Zettelkasten functionality. Ties into `zk` binary/language server
	use("mickael-menu/zk-nvim")
	-- Focus mode, Neovim-optimised
	use("folke/zen-mode.nvim")
	-- Markdown batteries
	use({
		"ixru/nvim-markdown",
		opt = true,
		ft = "markdown",
	})
	-- Markdown Preview server
	use({
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		opt = true,
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Visual
	-- use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
