-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keep cursor in the middle of the screen when making big moves.
-- Scroll half a screen
vim.keymap.set(
	"n",
	"<C-d>",
	"<C-d>zz",
	{ desc = "Scroll Downwards and centre" }
)
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Upwards and centre" })
-- Search
vim.keymap.set("n", "n", "nzzzv", { desc = "Search forwards and centre" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search backwards and centre" })
-- Ends of file
vim.keymap.set("n", "gg", "ggzz", { desc = "Go to first line and centre" })
vim.keymap.set("n", "G", "Gzz", { desc = "Go to EOF and centre" })
-- Quickfixlist
-- vim.keymap.set("n", "[q", "[qzz")
-- vim.keymap.set("n", "]q", "]qzz")
-- vim.keymap.set("n", "[Q", "[Qzz")
-- vim.keymap.set("n", "]Q", "]Qzz")

-- Paste/delete but don't add replaced content to default register.
-- Allows for replacing/deleting content without losing what's in the
-- "clipboard".
vim.keymap.set(
	"x",
	"<leader>p",
	[["_dP]],
	{ desc = "Paste without overriding default register" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>d",
	[["_d]],
	{ desc = "Delete without overriding default register" }
)

-- Copy to system clipboard
vim.keymap.set(
	{ "n", "v" },
	"<leader>y",
	[["+y]],
	{ desc = "Yank to system clipboard" }
)
vim.keymap.set(
	"n",
	"<leader>Y",
	[["+y$]],
	{ desc = "Yank to system clipboard (to EOL)" }
)
