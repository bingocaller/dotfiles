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
        ["<Esc>"] = require("telescope.actions").close,
      },
    },
    pickers = {
      file_browser = {
        hidden = true,
      },
      find_files = {
        hidden = true,
      },
      planets = {
        show_pluto = true,
      },
    },
  },
})

telescope.load_extension("fzf")

-- Command aliases
u.command("Files", "Telescope find_files theme=ivy")
u.command("History", "Telescope oldfiles theme=ivy")
u.command("Buffers", "Telescope buffers theme=ivy")

u.command("RgString", "Telescope grep_string theme=ivy")
u.command("Rg", "Telescope live_grep theme=ivy")
u.command("BLines", "Telescope current_buffer_fuzzy_find theme=ivy")

u.command("BCommits", "Telescope git_bcommits theme=ivy") -- Buffer commits
u.command("Branches", "Telescope git_branches theme=ivy")
u.command("Status", "Telescope git_status theme=ivy")

u.command("Commands", "Telescope commands theme=ivy")
u.command("HelpTags", "Telescope help_tags theme=ivy")
u.command("ManPages", "Telescope man_pages theme=ivy")

-- LSP
u.command("LspRef", "Telescope lsp_references theme=ivy")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspSym", "Telescope lsp_workspace_symbols theme=ivy")
u.command("LspAct", "Telescope lsp_code_actions theme=cursor")
u.command("LspRangeAct", "Telescope lsp_range_code_actions theme=cursor")

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
u.nmap("<Leader>fc", "<cmd>BCommits<CR>")
u.nmap("<Leader>gb", "<cmd>Branches<CR>")
u.nmap("<Leader>gs", "<cmd>Status<CR>")

-- Search for selected text withing project using f(ind) register
-- u.vmap("<C-f>", '"fy:Rg <C-R>f<C-W><cr>', { noremap = true })
