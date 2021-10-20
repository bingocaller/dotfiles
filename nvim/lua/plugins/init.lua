-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim", opt = true })

  local config = function(name)
    return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
    use({ path, config = config(name) })
  end

  -- Utilities & niceness
  use("airblade/vim-gitgutter")
  use("christoomey/vim-sort-motion")
  -- use("inkarkat/vim-ReplaceWithRegister")
  -- use("machakann/vim-highlightedyank")
  use("tommcdo/vim-exchange")
  use("tpope/vim-abolish") -- Abbreviation, Substitustion, Coercion
  use("tpope/vim-commentary")
  use("tpope/vim-repeat")
  use("tpope/vim-sleuth") -- Adjust indentation automatically
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired") -- Lots of mappings

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

  -- Code completion
  use_with_config("hrsh7th/vim-vsnip", "vsnip") -- snippets
  use({
    "hrsh7th/nvim-cmp", -- completion
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
    },
    config = config("cmp"),
  })
  -- use({
  --   "windwp/nvim-autopairs", -- autocomplete pairs
  --   config = config("autopairs"),
  --   wants = "nvim-cmp",
  -- })

  -- Integrations
  -- File explorer
  use({
    "kyazdani42/nvim-tree.lua",
    config = config("nvim-tree"),
    requires = { {
      "kyazdani42/nvim-web-devicons",
    } },
  })
  -- use_with_config("mcchrish/nnn.vim", "nnn") -- simple nnn integration
  use({
    "nvim-telescope/telescope.nvim",
    config = config("telescope"),
    requires = { {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    } },
  })

  -- LSP
  use("neovim/nvim-lspconfig") -- makes LSP configuration easier
  use("jose-elias-alvarez/nvim-lsp-ts-utils") -- utilities to improve TypeScript DX
  use_with_config("RRethy/vim-illuminate", "illuminate") -- highlights and allows moving between variable references
  -- use("~/git/null-ls.nvim") -- allows using neovim as language server

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = config("treesitter"),
  })
  use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- automatically close jsx tags
  use({ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }) -- makes jsx comments actually work

  -- Visual
  -- use_with_config("haishanh/night-owl.vim", "colours") -- colortheme
  use_with_config("folke/tokyonight.nvim", "colours") -- colortheme
  use_with_config("hoob3rt/lualine.nvim", "lualine") -- status line
  use_with_config("lukas-reineke/indent-blankline.nvim", "indent-blankline") -- show indentation guides

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
