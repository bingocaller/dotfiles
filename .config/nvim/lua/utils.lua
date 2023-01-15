-- Copied from https://github.com/jose-elias-alvarez/dotfiles/blob/main/.config/nvim/lua/utils.lua
local api = vim.api
local command = vim.api.nvim_create_user_command

local recompile = function()
	for name, _ in pairs(package.loaded) do
		if name:match("^user") and name ~= "user.plugins.lsp.mason" and name ~= "user.plugins.autopairs" then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	vim.cmd("PackerCompile")
end

command("Recompile", function()
	if vim.bo.buftype == "" then
		recompile()
		vim.notify("Wait for Compile Done", vim.log.levels.INFO)
	else
		vim.notify("Not available in this window/buffer", vim.log.levels.INFO)
	end
end, {
	nargs = "*",
})

local get_map_options = function(custom_options)
	local options = { silent = true }
	if custom_options then
		options = vim.tbl_extend("force", options, custom_options)
	end
	return options
end

local M = {}

M.map = function(mode, target, source, opts)
	api.nvim_set_keymap(mode, target, source, get_map_options(opts))
end

for _, mode in ipairs({ "n", "o", "i", "v", "t", "x" }) do
	M[mode .. "map"] = function(...)
		M.map(mode, ...)
	end
end

M.buf_map = function(bufnr, mode, target, source, opts)
	api.nvim_buf_set_keymap(bufnr or 0, mode, target, source, get_map_options(opts))
end

M.command = function(name, fn)
	vim.cmd(string.format("command! %s %s", name, fn))
end

M.lua_command = function(name, fn)
	M.command(name, "lua " .. fn)
end

M.t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.input = function(keys, mode)
	vim.api.nvim_feedkeys(M.t(keys), mode or "i", true)
end

return M
