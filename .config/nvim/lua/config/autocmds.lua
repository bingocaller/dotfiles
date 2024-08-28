-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- Exceptions to defatult indentation settings (see ./set.lua); could also be
-- handled in ftplugin, but it becomes untenable with many different file types
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.css", "*.scss", "*.sass", "*.json" },
	command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab",
	group = autocmd_group,
})

-- Disable Treesitter on big files
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*" },
	callback = function()
		local filesize = vim.fn.getfsize(vim.fn.expand("%:p"))
		if filesize > 1024 * 1024 then
			vim.treesitter.stop()
		end
	end,
	group = autocmd_group,
})

-- "Snippets" for JS/TS using abbreviations.
-- Original idea from https://vonheikemen.github.io/devlog/tools/using-vim-abbreviations/

-- Create group to assign commands
local abbreviations = vim.api.nvim_create_augroup("Abbreviation auto-commands", { clear = true })

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
