--local lspconfig = require("lspconfig")
--local lsp_zero = require("lsp-zero").preset({
--	name = "recommended",
--	set_lsp_keymaps = {
--		omit = { "gs" },
--	},
--})

--lsp_zero.on_attach(function(_client, bufnr)
--	-- lsp_zero.default_keymaps({ buffer = bufnr })
--	lsp_zero.buffer_autoformat()
--end)

--lsp_zero.set_sign_icons({
--	error = "",
--	warn = "",
--	hint = "",
--	info = "",
--})

---- Skip setup of rust-analyzer. rust-tools handles that for us.
--lsp_zero.skip_server_setup({ "rust_analyzer" })

---- Kept here for reference; we might need to use this instead of
---- buffer_autoformat() to avoid Prettier wreaking havoc on files that have
---- better LSPs/formatters available.
---- lsp_zero.format_on_save({
---- 	servers = {
---- 		["lua_ls"] = { "lua" },
---- 		["rust_analyzer"] = { "rust" },
---- 		["stylelint_lsp"] = { "css", "scss", "sass" },
---- 	},
---- })

---- Configure lua language server for Neovim
--lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

---- Set stylelint to fix formatting on format. This will happen on save because
---- we've set up formatting on save (lsp.buffer_autoformat()).
--lspconfig.stylelint_lsp.setup({
--	settings = {
--		stylelintplus = {
--			autoFixOnFormat = true,
--		},
--	},
--})

--lsp_zero.setup()

---- Use virtual text to display diagnostics
---- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#configure-errors-messages
--vim.diagnostic.config({
--	virtual_text = true,
--})

---- LSP-specific setups

---- We skipped setup of rust-analyzer because rust-tools handles that for us
--require("rust-tools").setup()

---- null-ls setup

--local null_ls = require("null-ls")
--null_ls.setup({
--	sources = {
--		-- Replace these with the tools you want to install
--		-- null_ls.builtins.diagnostics.eslint,
--		null_ls.builtins.formatting.prettier,
--		null_ls.builtins.formatting.stylua,
--	},
--})
--require("mason-null-ls").setup({
--	ensure_installed = nil,
--	automatic_installation = true,
--	automatic_setup = true,
--	-- handlers = {
--	-- Here you can add functions to register sources.
--	-- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
--	--
--	-- If left empty, mason-null-ls will  use a "default handler"
--	-- to register all sources
--	-- }
--})
