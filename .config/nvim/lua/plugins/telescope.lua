local telescope = require("telescope")

local u = require("utils")

telescope.setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "› ",
		mappings = {
			i = {
				-- Use Esc to close the picker even in insert mode,
				-- essentially disabling normal mode.
				["<Esc>"] = require("telescope.actions").close,
			},
		},
	},
	pickers = {
		buffers = {
			theme = "ivy",
		},
		commands = {
			theme = "ivy",
		},
		current_buffer_fuzzy_find = {
			theme = "ivy",
		},
		find_files = {
			hidden = true,
			theme = "ivy",
		},
		git_bcommits = {
			theme = "ivy",
		},
		git_branches = {
			theme = "ivy",
		},
		git_status = {
			theme = "ivy",
		},
		grep_string = {
			hidden = true,
			theme = "ivy",
		},
		help_tags = {
			theme = "ivy",
		},
		live_grep = {
			hidden = true,
			theme = "ivy",
		},
		lsp_code_actions = {
			theme = "cursor",
		},
		lsp_definitions = {
			theme = "ivy",
		},
		lsp_range_code_actions = {
			theme = "cursor",
		},
		lsp_references = {
			theme = "ivy",
		},
		lsp_workspace_symbols = {
			theme = "ivy",
		},
		man_pages = {
			theme = "ivy",
		},
		oldfiles = {
			theme = "ivy",
		},
		planets = {
			show_pluto = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

-- Command aliases
u.command("Files", "lua require('telescope.builtin').find_files()")
u.command("History", "lua require('telescope.builtin').oldfiles()")
u.command("Buffers", "lua require('telescope.builtin').buffers()")

u.command("RgString", "lua require('telescope.builtin').grep_string()")
u.command("Rg", "lua require('telescope.builtin').live_grep()")
u.command("BLines", "lua require('telescope.builtin').current_buffer_fuzzy_find()")

u.command("BCommits", "lua require('telescope.builtin').git_bcommits()") -- Buffer commits
u.command("Branches", "lua require('telescope.builtin').git_branches()")
u.command("Status", "lua require('telescope.builtin').git_status()")

u.command("Commands", "lua require('telescope.builtin').commands()")
u.command("HelpTags", "lua require('telescope.builtin').help_tags()")
u.command("ManPages", "lua require('telescope.builtin').man_pages()")

-- LSP
u.command("LspRef", "lua require('telescope.builtin').lsp_references()")
u.command("LspDef", "lua require('telescope.builtin').lsp_definitions()")
u.command("LspSym", "lua require('telescope.builtin').lsp_workspace_symbols()")
-- u.command("LspAct", "lua require('telescope.builtin').lsp_code_actions()")
-- u.command("LspRangeAct", "lua require('telescope.builtin').lsp_range_code_actions()")
u.command("LspAct", "lua vim.lsp.buf.code_action()")
u.command("LspRangeAct", "lua vim.lsp.buf.range_code_action()")

-- Command bindings
u.nmap("<C-p>", "<cmd>Files<CR>")
u.nmap("<C-b>", "<cmd>Buffers<CR>")
u.nmap("<C-h>", "<cmd>History<CR>")

u.nmap("<C-f>", "<cmd>RgString<CR>") -- Search for word under cursor within project.
u.nmap("<Leader>ff", "<cmd>Rg<CR>")
u.nmap("<Leader>fl", "<cmd>BLines<CR>")

-- u.nmap("<M>p", "<cmd>Commands<CR>")
u.nmap("<Leader>fs", "<cmd>LspSym<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")

-- Git commands
u.nmap("<Leader>gc", "<cmd>BCommits<CR>")
u.nmap("<Leader>gb", "<cmd>Branches<CR>")
u.nmap("<Leader>gs", "<cmd>Status<CR>")

-- Search for selected text within project using f(ind) register
-- u.vmap("<C-f>", '"fy:Rg <C-R>f<C-W><cr>', { noremap = true })
