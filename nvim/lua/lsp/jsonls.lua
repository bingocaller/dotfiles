local lspconfig = require("lspconfig")

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas {
          select = {
            "babelrc.json",
            ".eslintrc",
            "package.json",
            ".postcssrc",
            "prettierrc.json",
            ".stylelintrc",
            "tsconfig.json",
            "Web App Manifest",
            ".yarnrc.yml",
          },
        },
      },
    }
  }
end

return M
