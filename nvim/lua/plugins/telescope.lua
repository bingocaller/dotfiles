local telescope = require("telescope")

local u = require("utils")

telescope.setup({
  defaults = {
    prompt_prefix = "› ",
    selection_caret = "› ",
    mappings = {
      i = {
        -- Use Esc to close the picker even in insert mode,
        -- essentially disabling normal mode.
        ["<Esc>"] = "close"
      }
    }
  }
})

telescope.load_extension("fzf")

-- Command aliases
u.command("Files", "Telescope find_files")
u.command("Rg", "Telescope live_grep")
u.command("BLines", "Telescope current_buffer_fuzzy_find")
u.command("History", "Telescope oldfiles")
u.command("Buffers", "Telescope buffers")
u.command("BCommits", "Telescope git_bcommits")
u.command("Commits", "Telescope git_commits")
u.command("HelpTags", "Telescope help_tags")
-- lsp
u.command("LspRef", "Telescope lsp_references")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspSym", "Telescope lsp_workspace_symbols")
u.command("LspAct", "Telescope lsp_code_actions")
u.command("ManPages", "Telescope man_pages")

-- Command bindings
u.nmap("<C-p>", "<cmd>Files<CR>")
u.nmap("<C-f>", ":Telescope grep_string<cr>") -- Search for word under cursor within project.
-- u.nmap("<Leader>fg", "<cmd>Rg<CR>")
u.nmap("<C-b>", "<cmd>Buffers<CR>")
u.nmap("<C-h>", "<cmd>History<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")
u.nmap("<Leader>fl", "<cmd>BLines<CR>")
u.nmap("<Leader>fc", "<cmd>BCommits<CR>")
u.nmap("<Leader>fs", "<cmd>LspSym<CR>")

-- Search for selected text withing project using f(ind) register
-- u.vmap("<C-f>", '"fy:Rg <C-R>f<C-W><cr>', { noremap = true })
