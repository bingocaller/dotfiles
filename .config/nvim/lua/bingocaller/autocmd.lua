----------------
-- Autocommands
----------------

-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- Exceptions to defatult indentation settings (see ./set.lua); could also be
-- handled in ftplugin, but it becomes untenable with many different file types
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.css", "*.scss", "*.sass", "*.json" },
	command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab",
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	desc = "Highlight on yank",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = { "help", "qf", "fugitiveblame" },
	desc = "Bind `q` to close the buffer for help files, quickfixlist, and fugitive.vim blame windows",
	command = "nnoremap <buffer> q :q<CR>",
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
	desc = "Auto-format JavaScript/TypeScript files after saving",
	callback = function()
		vim.cmd(":EslintFixAll")
	end,
	group = autocmd_group,
})


-- "Snippets" for JS/TS using abbreviations.
-- Most of these are from https://vonheikemen.github.io/devlog/tools/using-vim-abbreviations/

-- Create group to assign commands
local abbreviations = vim.api.nvim_create_augroup("Abbreviation auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = 'console.log();',
	command = "iabbrev <buffer> log console.log();<Left><Left>",
	group = abbreviations,
})

-- IIFEs
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "IIFE",
	command = "iabbrev <buffer> iife (function() {})();<C-o>4h<CR><CR><Up><C-i>",
	group = abbreviations,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "Arrow-function IIFE",
	command = "iabbrev <buffer> iife> (() => {})();<C-o>4h<CR><CR><Up><C-i>",
	group = abbreviations,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "Async IIFE",
	command = "iabbrev <buffer> aiife (async function() {})();<C-o>4h<CR><CR><Up><C-i>",
	group = abbreviations,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "Async arrow-function IIFE",
	command = "iabbrev <buffer> aiife> (async () => {})();<C-o>4h<CR><CR><Up><C-i>",
	group = abbreviations,
})

-- `for` loops
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "for loop",
	command = "iabbrev <buffer> for@ for(let i = 0; i < z; i++) {<CR><CR>}<Esc>?z<CR>s",
	group = abbreviations,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "for..of",
	command = "iabbrev <buffer> forof for (const z of array) {<CR><CR>}<Esc>?z<CR>s",
	group = abbreviations,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	desc = "for..in",
	command = "iabbrev <buffer> forin for (const z in object) {<CR><CR>}<Esc>?z<CR>s",
	group = abbreviations,
})
