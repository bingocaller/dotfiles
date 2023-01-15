-- Set Lua LSP `cmd`
local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local root = vim.fn.getenv("HOME") .. "/dev/lua-language-server/"
local binary = root .. "bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local settings = {
	Lua = {
		runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = "LuaJIT",
			-- Setup your lua path
			path = runtime_path,
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = vim.api.nvim_get_runtime_file("", true),
		},
		diagnostics = {
			enable = true,
			-- Get the language server to recognize the given globals
			globals = {
				"global", -- used for Neovim config, see ~/.config/nvim/init.lua
				"hs", -- hammerspoon
				"spoon", -- hammerspoon
				"vim",
			},
		},
		-- Do not send telemetry data containing a randomized but unique identifier
		telemetry = {
			enable = false,
		},
	},
}

local M = {}
M.setup = function(on_attach, capabilities)
	require("lspconfig").sumneko_lua.setup({
		on_attach = on_attach,
		cmd = { binary, "-E", root .. "main.lua" },
		settings = settings,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
end

return M
