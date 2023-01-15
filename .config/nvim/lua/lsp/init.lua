local lsp = vim.lsp
local api = vim.api

local border_opts = { border = "rounded", focusable = false, scope = "line" }

vim.diagnostic.config({
	float = border_opts,
	signs = true,
	underline = true,
	virtual_text = false, -- This is usually more disruptive than helpful
})

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)
-- lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
-- 	underline = true,
-- 	signs = true,
-- 	virtual_text = true,
-- })

-- use lsp formatting if it's available (and if it's good)
-- otherwise, fall back to null-ls
local preferred_formatting_clients = { "eslint" }
local fallback_formatting_client = "null-ls"

local formatting = function(bufnr)
	bufnr = tonumber(bufnr) or api.nvim_get_current_buf()

	local selected_client
	for _, client in ipairs(lsp.buf_get_clients(bufnr)) do
		if vim.tbl_contains(preferred_formatting_clients, client.name) then
			selected_client = client
			break
		end

		if client.name == fallback_formatting_client then
			selected_client = client
		end
	end

	if not selected_client then
		return
	end

	local params = lsp.util.make_formatting_params()
	selected_client.request("textDocument/formatting", params, function(err, res)
		if err then
			local err_msg = type(err) == "string" and err or err.message
			vim.notify("global.lsp.formatting: " .. err_msg, vim.log.levels.WARN)
			return
		end

		if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, "modified") then
			return
		end

		if res then
			lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or "utf-16")
			api.nvim_buf_call(bufnr, function()
				vim.cmd("silent noautocmd update")
			end)
		end
	end, bufnr)
end

global.lsp = {
	border_opts = border_opts,
	formatting = formatting,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local u = require("utils")
	-- Disable automatic formatting for servers that have Formatter set up
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end
	-- commands
	u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
	u.lua_command("LspHover", "vim.lsp.buf.hover()")
	u.lua_command("LspRename", "vim.lsp.buf.rename()")
	u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
	u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
	u.lua_command("LspDiagLine", "vim.diagnostic.open_float()")
	u.lua_command("LspSignatureHelp", "vim.lsp.buf.signature_help()")
	u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")

	-- bindings
	u.buf_map(bufnr, "n", "<leader>rn", ":LspRename<CR>")
	u.buf_map(bufnr, "n", "<leader>rs", ":LspRestart<CR>")
	u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
	u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
	u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
	u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
	u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

	-- telescope
	u.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
	u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	u.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
	u.buf_map(bufnr, "v", "ga", "<Esc><cmd> LspRangeAct<CR>")

	if client.supports_method("textDocument/formatting") then
		vim.cmd([[
          augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePost <buffer> silent! lua global.lsp.formatting(vim.fn.expand("<abuf>"))
          augroup END
        ]])
	end

	require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local default_settings_servers = {
	"bashls",
	"cmake",
	-- Deno needs a bit more setup in order to coexist with tsserver
	-- See https://github.com/neovim/nvim-lspconfig/issues/927
	-- 'denols',
	"dockerls",
	"pyright",
	"rust_analyzer",
	"sqlls",
	"stylelint_lsp",
	"svelte",
	"vimls",
	"yamlls",
}

local lspconfig = require("lspconfig")
for _, default_settings_server in ipairs(default_settings_servers) do
	lspconfig[default_settings_server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

-- More elaborate configuartions below
for _, server in ipairs({
	"cssls",
	"emmet_ls",
	"eslint",
	"html",
	"jsonls",
	"null-ls",
	"sumneko_lua",
	"tsserver",
}) do
	require("lsp." .. server).setup(on_attach, capabilities)
end

-- suppress lspconfig messages
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("%[lspconfig%]") then
		return
	end

	notify(msg, ...)
end
