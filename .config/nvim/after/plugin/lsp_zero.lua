local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	-- lsp_zero.buffer_autoformat()
end)

lsp_zero.format_on_save({
	servers = {
		html = { 'html', 'htmldjango' },
		['lua_ls'] = { 'lua' },
	}
})

lsp_zero.set_sign_icons({
	error = "",
	warn = "",
	hint = "",
	info = ""
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
		emmet_ls = function()
			require('lspconfig').emmet_ls.setup({
				filetypes = {
					"astro",
					"css",
					"eruby",
					"html",
					"htmldjango",
					-- "javascriptreact",
					"less",
					"pug",
					"sass",
					"scss",
					"svelte",
					-- "typescriptreact",
					"vue",
				}
			})
		end,
		html = function()
			require('lspconfig').html.setup({
				filetypes = { "html", "htmldjango" }
			})
		end,
		---- Configure lua language server for Neovim
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
		stylelint_lsp = function()
			require('lspconfig').stylelint_lsp.setup({
				-- Exclude regular javascript and typescript files, include
				-- astro.
				filetypes = {
					"astro",
					"css",
					"less",
					"scss",
					"sugarss",
					"vue",
					"wxss",
					-- "javascript",
					"javascriptreact",
					-- "typescript",
					"typescriptreact",
				},
				settings = {
					stylelintplus = {
						-- autoFixOnFormat works when
						-- lsp_zero.buffer_autoformat() is enabled.
						-- autoFixOnFormat = true,
						autoFixOnSave = true,
						cssInJs = true,
					}
				}
			})
		end,
		-- Disable tsserver setup in favour of pmizio/typescript-tools.nvim
		tsserver = lsp_zero.noop,
	}
})

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/api-reference.md#extend_cmpopts
lsp_zero.extend_cmp()

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

local kind_icons = {
	Class = "󰠱",
	Color = "󰏘",
	Constant = "󰏿",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "󰇽",
	File = "󰈙",
	Folder = "󰉋",
	Function = "󰊕",
	Interface = "",
	Keyword = "󰌋",
	Method = "󰆧",
	Module = "",
	Operator = "󰆕",
	Property = "󰜢",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "󰅲",
	Unit = "",
	Value = "󰎠",
	Variable = "󰂡",
}

-- This is required in order to enable friendly-snippets.
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#add-an-external-collection-of-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	-- Change order of entries if menu appears above cursor so the first option
	-- is always closest.
	entries = { name = 'custom', selection_order = 'near_cursor' },
	-- Show coloured icon on left side of menu and offset the menu accordingly,
	-- so the text aligns with what’s being typed. Here’s an approximation of
	-- what it looks like:
	--      forma┃
	-- │ 󰜢  formatting (Property) [LSP] │
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, item)
			if entry.source.name == 'cmdline' then
				-- We don’t want anything fancy for cmdline completion; just the
				-- name of the completion.
				item.menu = ""
				item.kind = ""
				return item
			else
				-- Concatonate the icons with the name of the item kind but
				-- don’t override `vim.kind` yet.
				local icon = string.format(' %s ', kind_icons[item.kind])
				item.abbr = string.format('%s (%s)', item.abbr, item.kind)
				-- Kind icons
				item.kind = icon
				-- Source
				item.menu = ({
					buffer = "[Buffer]",
					luasnip = "[LuaSnip]",
					nvim_lsp = "[LSP]",
					path = "[Path]",
					spell = "[Spell]",
					-- latex_symbols = "[LaTeX]",
				})[entry.source.name]
				return item
			end
		end,
	},
	-- formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
		-- Use "Super Tab"
		-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#enable-super-tab
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		-- These keymaps allow us to jump back and forth through insertion
		-- points even when cmp has more suggestions (in which case Tab would
		-- cycle through those instead).
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
		-- scroll up and down the documentation window
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- Anything coming from the LSP.
		{ name = "luasnip" }, -- Snippets.
		-- { name = "latex_symbols" },
	}, {
		-- Don't show these sources while items from first group are available.
		-- See :h cmp-config.sources (cmp-config.sources[n].group_index)
		{ name = "spell" }, -- Suggest words from spellang
		{
			name = "buffer", -- Complete buffer words.
			-- Include suggestions from all buffers, instead of just the current
			-- one.
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		{ name = "path" }, -- Complete folder- and file paths.
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	window = {
		completion = {
			col_offset = -3,
			side_padding = 0,
			-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		},
	},
})
-- Completions for Vim’s command line.
-- `/` cmdline setup.
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})
