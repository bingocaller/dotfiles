local lsp = require("lsp-zero")

-- Use recommended LSP Zero config but override sign icons
-- lsp.preset("recommended")
lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
})

-- Configure lua language server for Neovim
lsp.nvim_workspace()

lsp.setup()

-- Use virtual text to display diagnostics
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#configure-errors-messages
vim.diagnostic.config({
	virtual_text = true,
})

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#intergrate-with-null-ls
-- https://github.com/jay-babu/mason-null-ls.nvim#primary-source-of-truth-is-mason-null-ls
local mason_null_ls = require("mason-null-ls")
mason_null_ls.setup({
	automatic_installation = true,
	automatic_setup = true,
})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

mason_null_ls.setup_handlers()
