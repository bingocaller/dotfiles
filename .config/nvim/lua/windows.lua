local u = require("utils")

-- ----------------
-- Window switching
-- ----------------

-- Alt + hjkl: jump between windows
-- Alt + HJKL: move windows around
u.nmap("<a-h>", "<c-w>h", { noremap = true })
u.nmap("<a-j>", "<c-w>j", { noremap = true })
u.nmap("<a-k>", "<c-w>k", { noremap = true })
u.nmap("<a-l>", "<c-w>l", { noremap = true })
u.nmap("<a-H>", "<c-w>H", { noremap = true })
u.nmap("<a-J>", "<c-w>J", { noremap = true })
u.nmap("<a-K>", "<c-w>K", { noremap = true })
u.nmap("<a-L>", "<c-w>L", { noremap = true })
u.tmap("<a-h>", "<c-\\><c-n><c-w>h", { noremap = true })
u.tmap("<a-j>", "<c-\\><c-n><c-w>j", { noremap = true })
u.tmap("<a-k>", "<c-\\><c-n><c-w>k", { noremap = true })
u.tmap("<a-l>", "<c-\\><c-n><c-w>l", { noremap = true })
u.tmap("<a-H>", "<c-\\><c-n><c-w>H", { noremap = true })
u.tmap("<a-J>", "<c-\\><c-n><c-w>J", { noremap = true })
u.tmap("<a-K>", "<c-\\><c-n><c-w>K", { noremap = true })
u.tmap("<a-L>", "<c-\\><c-n><c-w>L", { noremap = true })

-- ----------------
-- Tab switching
-- ----------------

-- Alt + [ / ]: cycle between tabs
u.tmap("<a-]>", "<c-\\><c-n>gt", { noremap = true })
u.nmap("<a-]>", "gt", { noremap = true })
u.tmap("<a-[>", "<c-\\><c-n>gT", { noremap = true })
u.nmap("<a-[>", "gT", { noremap = true })

-- Alt + number: pick tab by number
u.nmap("<a-1>", "1gt", { noremap = true })
u.nmap("<a-2>", "2gt", { noremap = true })
u.nmap("<a-3>", "3gt", { noremap = true })
u.nmap("<a-4>", "4gt", { noremap = true })
u.nmap("<a-5>", "5gt", { noremap = true })
u.nmap("<a-6>", "6gt", { noremap = true })
u.nmap("<a-7>", "7gt", { noremap = true })
u.nmap("<a-8>", "8gt", { noremap = true })
u.nmap("<a-9>", "9gt", { noremap = true })
u.tmap("<a-1>", "<c-\\><c-n>1gt", { noremap = true })
u.tmap("<a-2>", "<c-\\><c-n>2gt", { noremap = true })
u.tmap("<a-3>", "<c-\\><c-n>3gt", { noremap = true })
u.tmap("<a-4>", "<c-\\><c-n>4gt", { noremap = true })
u.tmap("<a-5>", "<c-\\><c-n>5gt", { noremap = true })
u.tmap("<a-6>", "<c-\\><c-n>6gt", { noremap = true })
u.tmap("<a-7>", "<c-\\><c-n>7gt", { noremap = true })
u.tmap("<a-8>", "<c-\\><c-n>8gt", { noremap = true })
u.tmap("<a-9>", "<c-\\><c-n>9gt", { noremap = true })
