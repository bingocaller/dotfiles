local auto_session = require("auto-session")

-- Recommended sessionoptions config
-- https://github.com/rmagatti/auto-session#recommended-sessionoptions-config

-- Note: if you use packer.nvim's lazy loading feature, you might want to not
-- add the options value to sessionoptions. It might lead to weird behaviour
-- with the lazy loading, especially around key-based lazy loading.
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,resize,winpos,terminal"

auto_session.setup({
  auto_session_suppress_dirs = { "node_modules" },
})
