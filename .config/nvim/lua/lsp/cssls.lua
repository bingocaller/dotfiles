local M = {}

M.setup = function(on_attach, capabilities)
	--Enable (broadcasting) snippet capability for completion
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	require("lspconfig").cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
