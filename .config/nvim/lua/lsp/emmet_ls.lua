-- https://github.com/pedro757/emmet

local M = {}
M.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig.configs")
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	if not configs.ls_emmet then
		configs.ls_emmet = {
			default_config = {
				cmd = { "ls_emmet", "--stdio" },
				filetypes = {
					"astro",
					"css",
					"haml",
					"handlebars",
					"hbs",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"pug",
					"sass",
					"scss",
					"slim",
					"sss",
					"stylus",
					"typescript",
					"typescriptreact",
					"xml",
					"xsl",
				},
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
				settings = {},
			},
		}
	end

	lspconfig.ls_emmet.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

return M
