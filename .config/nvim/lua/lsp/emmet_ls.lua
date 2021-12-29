-- https://github.com/pedro757/emmet

local lspconfig = require("lspconfig")

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    cmd = { "ls_emmet", "--stdio" },
    filetypes = {
      "css",
      "haml",
      "html",
      "javascriptreact",
      "less",
      "pug",
      "sass",
      "scss",
      "slim",
      "sss",
      "stylus",
      "typescriptreact",
      "xml",
      "xsl",
    },
    on_attach = on_attach,
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
  })
end

return M
