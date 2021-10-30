local formatter = require("formatter")

local eslint_fix = function()
  return {
    exe = "eslint_d", -- Runs ESLint in a daemon for speed
    args = { "--fix-to-stdout", "--stdin", "--stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
    stdin = true,
  }
end

formatter.setup({
  logging = false,
  filetype = {
    javascript = { eslint_fix },
    javascriptreact = { eslint_fix },
    typescript = { eslint_fix },
    typescriptreact = { eslint_fix },
    css = {
      function()
        return {
          exe = "stylelint_d", -- Runs stylelint in a daemon for speed
          args = { "--fix", "--stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end,
    },
    scss = {
      function()
        return {
          exe = "stylelint_d",
          args = {
            "--fix",
            "--custom-syntax=postcss-scss",
            "--stdin-filename",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end,
    },
    lua = {
      -- Stylua
      function()
        return {
          exe = "stylua",
          args = { "--indent-width", 2, "--indent-type", "Spaces", "-" },
          stdin = true,
        }
      end,
    },
  },
})

-- Runs Formatter on save
vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.tsx,*.css,*.scss,*.lua : FormatWrite
    augroup END
  ]],
  true
)
