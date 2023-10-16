local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
	error = "",
	warn = "",
	hint = "",
	info = ""
})

local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
		-- Ctrl+e to toggle completion menu
		['<C-e>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.abort()
			else
				cmp.complete()
			end
		end),
		-- Tab/Shift+tab to cycle options
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping.select_next_item({ behavior = 'select' })
			else
				fallback() -- The fallback function sends a already mapped key.
			end
		end),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping.select_prev_item({ behavior = 'select' })
			else
				fallback()
			end
		end),
		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
		-- scroll up and down the documentation window
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
		---- Configure lua language server for Neovim
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
		---- rust-tools handles setup of rust-analyzer for us.
		rust_analyzer = function()
			require("rust-tools").setup()
		end,
	}
})
