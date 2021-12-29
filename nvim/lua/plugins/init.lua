-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim", opt = true })

  local config = function(name)
    return string.format("require('plugins.%s')", name)
  end

  -- local use_with_config = function(path, name)
  --   use({ path, config = config(name) })
  -- end

  -- LSP
  use("neovim/nvim-lspconfig") -- makes LSP configuration easier
  use("jose-elias-alvarez/nvim-lsp-ts-utils") -- utilities to improve TypeScript DX
  use({ "RRethy/vim-illuminate", config = config("illuminate") }) -- highlights and allows moving between variable references
  -- use("~/git/null-ls.nvim") -- allows using neovim as language server

  -- Formatting
  use({ "mhartington/formatter.nvim", config = config("formatter") })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = config("treesitter"),
  })
  use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- automatically close jsx tags
  use({ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }) -- makes jsx comments actually work

  -- Code completion
  use({
    "hrsh7th/nvim-cmp", -- completion
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      -- Snippets
      "L3MON4D3/LuaSnip", --snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    },
    config = config("cmp"),
  })

  -- Schemastore (set up is in ../lsp/jsonls.lua)
  use("b0o/schemastore.nvim")

  -- Custom text objects
  use("wellle/targets.vim") -- many useful additional text objects
  use({
    "kana/vim-textobj-user",
    {
      "jasonlong/vim-textobj-css", -- av/iv for variable segment
    },
  })

  -- Registers
  -- use_with_config("svermeulen/vim-subversive", "subversive") -- adds "substitute" operator
  -- use_with_config("svermeulen/vim-cutlass", "cutlass") -- separates cut and delete operations
  -- use_with_config("svermeulen/vim-yoink", "yoink") -- improves paste
  -- use_with_config("tversteeg/registers.nvim", "registers") -- shows register contents intelligently

  -- Integrations
  -- File explorer
  use({
    "kyazdani42/nvim-tree.lua",
    config = config("nvim-tree"),
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  -- use_with_config("mcchrish/nnn.vim", "nnn") -- simple nnn integration
  use({
    "nvim-telescope/telescope.nvim",
    config = config("telescope"),
    requires = {
      {
        "nvim-treesitter/nvim-treesitter",
      },
      {
        "nvim-lua/plenary.nvim",
      },
      {
        "kyazdani42/nvim-web-devicons",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    },
  })

  -- Visual
  use({ "folke/tokyonight.nvim", config = config("colours") }) -- colortheme
  -- use({ "EdenEast/nightfox.nvim", config = config("colours") }) -- colortheme
  use({
    "nvim-lualine/lualine.nvim", -- status line
    requires = { "kyazdani42/nvim-web-devicons" },
    config = config("lualine"),
  })
  use({ "lukas-reineke/indent-blankline.nvim", config = config("indent-blankline") }) -- show indentation guides

  -- Utilities & niceness
  use("airblade/vim-gitgutter")
  use("christoomey/vim-sort-motion")
  use({ "rrethy/vim-hexokinase", run = "make hexokinase" }) -- show colours in code
  use("tommcdo/vim-exchange")
  use("tpope/vim-abolish") -- Abbreviation, Substitustion, Coercion
  use("tpope/vim-commentary")
  use("tpope/vim-repeat")
  use("tpope/vim-sleuth") -- Adjust indentation automatically
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired") -- Lots of mappings
  -- use({ "rmagatti/auto-session", config = config("auto-session") })

  -- Misc
  use("dag/vim-fish") -- fish support
  use("nvim-lua/plenary.nvim") -- required for some plugins (and testing)
  use("junegunn/goyo.vim") -- focus mode
  use({
    "iamcco/markdown-preview.nvim", -- preview markdown output in browser
    opt = true,
    ft = { "markdown" },
    config = "vim.cmd[[doautocmd BufEnter]]",
    run = "cd app && yarn install",
    cmd = "MarkdownPreview",
  })
end)
