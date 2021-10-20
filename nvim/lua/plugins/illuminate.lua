local u = require("utils")

u.map("n", "<a-n>", '<cmd> lua require"illuminate".next_reference{wrap=true}<CR>')
u.map("n", "<a-p>", '<cmd> lua require"illuminate".next_reference{reverse=true,wrap=true}<CR>')
