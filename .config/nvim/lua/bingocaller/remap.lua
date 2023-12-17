-- Zero moves to first character on line instead of beginning of line.
vim.keymap.set("n", "0", "^")
-- Move up and down by visible lines if current line is wrapped.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- Y yanks to end of line instead of the entire line.
vim.keymap.set("n", "Y", "y$")

-- Remove highlight, e.g. after search.
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>", { silent = true })

-- Move selected lines in visual mode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep the cursor in place when joining lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle of the screen when making big moves.
-- Scroll half a screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- End of file
vim.keymap.set("n", "G", "Gzz")
-- Quickfixlist
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[Q", "<cmd>cfirst<CR>zz")
vim.keymap.set("n", "]Q", "<cmd>clast<CR>zz")

-------------------
-- Leader mappings
-------------------

-- <leader> = <Space>
vim.g.mapleader = " "

-- Switch between the last two buffers
vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true })

-- Paste/delete but don't add replaced content to default register.
-- Allows for replacing/deleting content without losing what's in the
-- "clipboard".
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+y$]])

-- Show quickfixlist
vim.keymap.set("n", "<leader>q", ":copen<cr>")

-- Search and replace word under cursor for current buffer
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/I<Left><Left>]], { noremap = true })

-- ----------------
-- Window switching
-- ----------------

-- Alt + hjkl: jump between windows
-- Alt + HJKL: move windows around
vim.keymap.set("n", "<a-h>", "<c-w>h")
vim.keymap.set("n", "<a-j>", "<c-w>j")
vim.keymap.set("n", "<a-k>", "<c-w>k")
vim.keymap.set("n", "<a-l>", "<c-w>l")
vim.keymap.set("n", "<a-H>", "<c-w>H")
vim.keymap.set("n", "<a-J>", "<c-w>J")
vim.keymap.set("n", "<a-K>", "<c-w>K")
vim.keymap.set("n", "<a-L>", "<c-w>L")
vim.keymap.set("t", "<a-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<a-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<a-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<a-l>", "<c-\\><c-n><c-w>l")
vim.keymap.set("t", "<a-H>", "<c-\\><c-n><c-w>H")
vim.keymap.set("t", "<a-J>", "<c-\\><c-n><c-w>J")
vim.keymap.set("t", "<a-K>", "<c-\\><c-n><c-w>K")
vim.keymap.set("t", "<a-L>", "<c-\\><c-n><c-w>L")

-- ----------------
-- Tab switching
-- ----------------

-- Alt + [ / ]: cycle between tabs
vim.keymap.set("t", "<a-]>", "<c-\\><c-n>gt")
vim.keymap.set("n", "<a-]>", "gt")
vim.keymap.set("t", "<a-[>", "<c-\\><c-n>gT")
vim.keymap.set("n", "<a-[>", "gT")

-- Alt + number: pick tab by number
vim.keymap.set("n", "<a-1>", "1gt")
vim.keymap.set("n", "<a-2>", "2gt")
vim.keymap.set("n", "<a-3>", "3gt")
vim.keymap.set("n", "<a-4>", "4gt")
vim.keymap.set("n", "<a-5>", "5gt")
vim.keymap.set("n", "<a-6>", "6gt")
vim.keymap.set("n", "<a-7>", "7gt")
vim.keymap.set("n", "<a-8>", "8gt")
vim.keymap.set("n", "<a-9>", "9gt")
vim.keymap.set("t", "<a-1>", "<c-\\><c-n>1gt")
vim.keymap.set("t", "<a-2>", "<c-\\><c-n>2gt")
vim.keymap.set("t", "<a-3>", "<c-\\><c-n>3gt")
vim.keymap.set("t", "<a-4>", "<c-\\><c-n>4gt")
vim.keymap.set("t", "<a-5>", "<c-\\><c-n>5gt")
vim.keymap.set("t", "<a-6>", "<c-\\><c-n>6gt")
vim.keymap.set("t", "<a-7>", "<c-\\><c-n>7gt")
vim.keymap.set("t", "<a-8>", "<c-\\><c-n>8gt")
vim.keymap.set("t", "<a-9>", "<c-\\><c-n>9gt")
