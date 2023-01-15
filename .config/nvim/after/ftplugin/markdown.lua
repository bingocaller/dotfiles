-- Enable wrapping and spell-checking
vim.opt_local.wrap = true
vim.opt_local.spell = true

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
