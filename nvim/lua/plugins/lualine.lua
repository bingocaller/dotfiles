require("lualine").setup({
  options = {
    -- theme = "nightfly",
    theme = 'tokyonight',
    component_separators = { "|", "|" },
    section_separators = { "", "" },
    disabled_filetypes = {},
  },
  extensions = { "nvim-tree" },
})
