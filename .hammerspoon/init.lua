local message = require("NotSpoons.status-message")

require("NotSpoons.caffeine")
require("NotSpoons.flux")
require("NotSpoons.hyper")
require("NotSpoons.push-to-talk")
-- require("NotSpoons.shade")
-- require("NotSpoons.tidal")
require("NotSpoons.windows")

---------------------
-- ALERT STYLING
---------------------
-- hs.alert.defaultStyle = {
-- 	fillColor = {
-- 		hex = "2d2d2d", -- Looks like #3b3b3b
-- 		alpha = 1,
-- 	},
-- 	radius = 0,
-- 	strokeColor = {
-- 		hex = "222", -- Looks like #2d2d2d
-- 		alpha = 1,
-- 	},
-- 	strokeWidth = 12,
-- 	textColor = {
-- 		hex = "ececec", -- Looks like #f0f0f0
-- 		alpha = 1,
-- 	},
-- 	textFont = "JetBrainsMono Nerd Font",
-- 	textSize = 24,
-- 	atScreenEdge = 0,
-- 	fadeInDuration = 0.15,
-- 	fadeOutDuration = 0.15,
-- }

---------------------
-- RELOAD CONFIG
---------------------
-- Setup reload config message
local reloadConfigMessage = message.new("")
reloadConfigMessage.hidden = function()
	reloadConfigMessage:hide()
end
-- Use Hyper+` to reload Hammerspoon config
hs.hotkey
	.new({ "cmd", "alt", "ctrl", "shift" }, "`", function()
		hs.reload()
		-- Show reload config message, then hide it
		reloadConfigMessage:show()
		hs.timer.doAfter(1, reloadConfigMessage.hidden)
	end)
	:enable()
-- Auto-reload
local function reloadConfig(files)
	local doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
