local tsj_utils = require("treesj.langs.utils")
local html = require("treesj.langs.html")

require('treesj').setup({
	langs = {
		svg = tsj_utils.merge_preset(html, {}),
		xml = tsj_utils.merge_preset(html, {}),
	}
})
