local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "auto",
    component_separators = "│",
    section_separators = "",
  },
  sections = {
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      "diff",
      {
        "diagnostics",
        sources = { "nvim_lsp" },
      },
    },
    lualine_z = {
      "location",
      "os.date('%H:%M')",
    },
  },
  extensions = { "nvim-tree" },
})