local cmp = require("cmp")

local u = require("utils")

------------------
-- Code completion
------------------

-- Give more space for displaying messages.
-- vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.cmd("set shortmess+=c")

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.cmd([[
  if has("patch-8.1.1564")
    -- Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif
]])

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
    get_trigger_characters = function(trigger_characters)
      return vim.tbl_filter(function(char)
        return char ~= " " and char ~= "\t"
      end, trigger_characters)
    end,
  },
  completion = {
    -- Completion menu tweaks: show menu, show even if only one option is
    -- available, don't select anything automatically.
    -- Default value: menu,preview
    completeopt = "menu,menuone,noselect",
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) > 0 then
        u.input("<Plug>(vsnip-expand-or-jump)")
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#available"](1) > 0 then
        u.input("<Plug>(vsnip-expand-or-jump)")
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "emmet_ls" },
    { name = "vsnip", priority = 9999 },
    { name = "path" },
  },
})
