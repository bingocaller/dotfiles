local lspconfig = require("lspconfig")

local M = {}

M.setup = function(on_attach, capabilities)
  -- Emmet (https://github.com/aca/emmet-ls)
  if not lspconfig.emmet_ls then
    require("lspconfig/configs").emmet_ls = {
      default_config = {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "html", "css", "scss", "jsx", "tsx" },
        root_dir = function()
          return vim.loop.cwd()
        end,
        settings = {},
      },
      flags = {
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end
end

return M
