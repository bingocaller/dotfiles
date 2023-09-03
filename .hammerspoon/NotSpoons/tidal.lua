---------------------
-- TIDAL | WIP
-- Based on https://github.com/Hammerspoon/hammerspoon/blob/master/extensions/spotify/spotify.lua
---------------------

local as = require("hs.applescript")

-- Internal function to pass a command to Applescript.
local function tell(cmd)
	local _cmd = 'tell application "Tidal" to ' .. cmd
	local ok, result = as.applescript(_cmd)
	if ok then
		return result
	else
		return nil
	end
end

local playPauseTidal = function()
	tell("playpause")
end

hs.hotkey.new({ "cmd", "alt", "ctrl", "shift" }, "t", playPauseTidal):enable()
