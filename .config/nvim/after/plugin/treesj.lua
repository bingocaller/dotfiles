local tsj_utils = require("treesj.langs.utils")
local html = require("treesj.langs.html")

require("treesj").setup({
	use_default_keymaps = false,
	langs = {
		svg = tsj_utils.merge_preset(html, {}),
		xml = tsj_utils.merge_preset(html, {}),
	}
})

vim.keymap.set("n", "<leader>m", require("treesj").toggle)
