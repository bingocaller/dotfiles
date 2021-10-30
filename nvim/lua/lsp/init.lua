local lspconfig = require("lspconfig")

local u = require("utils")

local emmet_ls = require("lsp.emmet_ls")
local jsonls = require("lsp.jsonls")
local sumneko = require("lsp.sumneko")

local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  signs = true,
  virtual_text = true,
})

local popup_opts = { border = "single", focusable = false }

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, popup_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, popup_opts)

vim.g.lsp = {
  popup_opts = popup_opts,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Disable automatic formatting for servers that have Formatter set up
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
  -- commands
  u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
  u.lua_command("LspHover", "vim.lsp.buf.hover()")
  u.lua_command("LspRename", "vim.lsp.buf.rename()")
  u.lua_command("LspDiagPrev", "vim.lsp.diagnostic.goto_prev({ popup_opts = vim.g.lsp.popup_opts })")
  u.lua_command("LspDiagNext", "vim.lsp.diagnostic.goto_next({ popup_opts = vim.g.lsp.popup_opts })")
  u.lua_command("LspDiagLine", "vim.lsp.diagnostic.show_line_diagnostics(vim.g.lsp.popup_opts)")
  u.lua_command("LspSignatureHelp", "vim.lsp.buf.signature_help()")
  u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")

  -- bindings
  u.buf_map("n", "<leader>rn", ":LspRename<CR>", nil, bufnr)
  u.buf_map("n", "gy", ":LspTypeDef<CR>", nil, bufnr)
  u.buf_map("n", "K", ":LspHover<CR>", nil, bufnr)
  u.buf_map("n", "[a", ":LspDiagPrev<CR>", nil, bufnr)
  u.buf_map("n", "]a", ":LspDiagNext<CR>", nil, bufnr)
  u.buf_map("n", "<Leader>a", ":LspDiagLine<CR>", nil, bufnr)
  u.buf_map("i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", nil, bufnr)

  -- telescope
  u.buf_map("n", "gr", ":LspRef<CR>", nil, bufnr)
  u.buf_map("n", "gd", ":LspDef<CR>", nil, bufnr)
  u.buf_map("n", "ga", ":LspAct<CR>", nil, bufnr)

  require("illuminate").on_attach(client)
end

--Enable (broadcasting) snippet capability for completion.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "bashls",
  "cmake",
  -- Deno needs a bit more setup in order to coexist with tsserver
  -- See https://github.com/neovim/nvim-lspconfig/issues/927
  -- 'denols',
  "cssls",
  "dockerls",
  "html",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "stylelint_lsp",
  "svelte",
  "tsserver",
  "vimls",
  "yamlls",
  "zk",
}
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

-- More elaborate configuartions below

emmet_ls.setup(on_attach, capabilities)
jsonls.setup(on_attach, capabilities)
sumneko.setup(on_attach, capabilities)
