require("lualine").setup({
  options = {
    theme = "nightfly",
    component_separators = { "|", "|" },
    section_separators = { "", "" },
    disabled_filetypes = {},
  },
  extensions = { "nvim-tree" },
})
