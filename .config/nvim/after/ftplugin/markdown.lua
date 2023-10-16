-- Enable wrapping and spell-checking vim.opt_local.wrap = true vim.opt_local.spell = true

-- Unset line length limit and (implicitly) disable highlight
vim.opt.textwidth = 0

-- Settings for nvim-markdown
-- https://github.com/ixru/nvim-markdown
-- Don't conceal characters (in links and text formatting).
-- We have to set this again to override the default settings for nvim-markdown
vim.opt.conceallevel = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1
vim.g.vim_markdown_fenced_languages = {
	"bash",
	"css",
	"html",
	"javascript",
	"lua",
	"scss",
	"sh",
	"typescript",
	"vim",
}
-- Move Markdown_CreateLink to Control-l instead of Control-k, to not override
-- digraph functionality. (:h digraphs-use)
vim.keymap.set("i", "<Plug>", "<Plug>Markdown_CreateLink", {})
vim.keymap.set("i", "<C-l>", "<Plug>Markdown_CreateLink", {})
