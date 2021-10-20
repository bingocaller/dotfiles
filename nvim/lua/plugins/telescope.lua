local telescope = require("telescope")
local actions = require("telescope.actions")

local u = require("utils")

telescope.setup({
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore",
      "--hidden",
      "-g",
      "!.git",
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<Esc>"] = actions.close,
        ["<M-u>"] = actions.preview_scrolling_up,
        ["<M-d>"] = actions.preview_scrolling_down,
      },
    },
  },
})

telescope.load_extension("fzf")

vim.g.telescope = {
  -- try git_files and fall back to find_files
  find_files = function()
    local set = require("telescope.actions.set")
    local builtin = require("telescope.builtin")

    local opts = {
      attach_mappings = function(_, map)
        map("i", "<C-v>", function(prompt_bufnr)
          set.edit(prompt_bufnr, "vsplit")
        end)

        return true
      end,
    }

    local is_git_project = pcall(builtin.git_files, opts)
    if not is_git_project then
      builtin.find_files(opts)
    end
  end,
}

-- u.lua_command("Files", "vim.g.telescope.find_files()")
u.command("Files", "Telescope find_files")
u.command("Rg", "Telescope live_grep")
u.command("BLines", "Telescope current_buffer_fuzzy_find")
u.command("History", "Telescope oldfiles")
u.command("Buffers", "Telescope buffers")
u.command("BCommits", "Telescope git_bcommits")
u.command("Commits", "Telescope git_commits")
u.command("HelpTags", "Telescope help_tags")
u.command("ManPages", "Telescope man_pages")

u.map("n", "<C-p>", "<cmd>Files<CR>")
u.map("n", "<Leader>fg", "<cmd>Rg<CR>")
u.map("n", "<C-b>", "<cmd>Buffers<CR>")
u.map("n", "<C-h>", "<cmd>History<CR>")
u.map("n", "<Leader>fh", "<cmd>HelpTags<CR>")
u.map("n", "<Leader>fl", "<cmd>BLines<CR>")
u.map("n", "<Leader>fc", "<cmd>BCommits<CR>")
u.map("n", "<Leader>fs", "<cmd>LspSym<CR>")

-- lsp
u.command("LspRef", "Telescope lsp_references")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspSym", "Telescope lsp_workspace_symbols")
u.command("LspAct", "Telescope lsp_code_actions")
