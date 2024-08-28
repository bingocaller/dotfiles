---------------------
-- WINDOW MANAGEMENT
---------------------
local message = require("NotSpoons.status-message")

hs.window.animationDuration = 0

--------------------------------------------------------------------------------
-- Define WindowLayout Mode
--
-- WindowLayout Mode allows you to manage window layout using keyboard shortcuts
-- that are on the home row, or very close to it. Use Control+s to turn
-- on WindowLayout mode. Then, use any shortcut below to perform a window layout
-- action. For example, to send the window left, press and release
-- Control+s, and then press h.
--
--   h/j/k/l => send window to the left/bottom/top/right half of the screen
--   i => send window to the upper left quarter of the screen
--   o => send window to the upper right quarter of the screen
--   , => send window to the lower left quarter of the screen
--   . => send window to the lower right quarter of the screen
--   return => make window full screen
--   n => send window to the next monitor
--   left => send window to the monitor on the left (if there is one)
--   right => send window to the monitor on the right (if there is one)
--------------------------------------------------------------------------------

local windowLayoutMode = hs.hotkey.modal.new({}, "F16")

windowLayoutMode.statusMessage = message.new("󰝘")
windowLayoutMode.entered = function()
	windowLayoutMode.statusMessage:show()
end
windowLayoutMode.exited = function()
	windowLayoutMode.statusMessage:hide()
end

-- Bind the given key to call the given function and exit WindowLayout mode
function windowLayoutMode.bindWithAutomaticExit(mode, modifiers, key, fn)
	mode:bind(modifiers, key, function()
		mode:exit()
		fn()
	end)
end

-- https://www.hammerspoon.org/docs/hs.window.html
windowLayoutMode:bindWithAutomaticExit({}, "return", function()
	hs.window.focusedWindow():maximize()
end)

windowLayoutMode:bindWithAutomaticExit({}, "space", function()
	local centerFullHeight = hs.geometry(0.2, 0, 0.6, 1)
	hs.window.focusedWindow():move(centerFullHeight)
end)

windowLayoutMode:bindWithAutomaticExit({}, "h", function()
	-- https://www.hammerspoon.org/docs/hs.geometry.html
	-- hs.geometry(X,Y,W,H)
	local leftHalf = hs.geometry(0, 0, 0.5, 1)
	hs.window.focusedWindow():move(leftHalf)
end)

windowLayoutMode:bindWithAutomaticExit({}, "j", function()
	local bottomHalf = hs.geometry(0, 0.5, 1, 0.5)
	hs.window.focusedWindow():move(bottomHalf)
end)

windowLayoutMode:bindWithAutomaticExit({}, "k", function()
	local topHalf = hs.geometry(0, 0, 1, 0.5)
	hs.window.focusedWindow():move(topHalf)
end)

windowLayoutMode:bindWithAutomaticExit({}, "l", function()
	local rightHalf = hs.geometry(0.5, 0, 0.5, 1)
	hs.window.focusedWindow():move(rightHalf)
end)

windowLayoutMode:bindWithAutomaticExit({ "shift" }, "h", function()
	hs.window.focusedWindow():moveOneScreenWest()
end)

windowLayoutMode:bindWithAutomaticExit({ "shift" }, "l", function()
	hs.window.focusedWindow():moveOneScreenEast()
end)

windowLayoutMode:bindWithAutomaticExit({}, "i", function()
	local topLeft = hs.geometry(0, 0, 0.5, 0.5)
	hs.window.focusedWindow():move(topLeft)
end)

windowLayoutMode:bindWithAutomaticExit({}, "o", function()
	local topRight = hs.geometry(0.5, 0, 0.5, 0.5)
	hs.window.focusedWindow():move(topRight)
end)

windowLayoutMode:bindWithAutomaticExit({}, ",", function()
	local bottomLeft = hs.geometry(0, 0.5, 0.5, 0.5)
	hs.window.focusedWindow():move(bottomLeft)
end)

windowLayoutMode:bindWithAutomaticExit({}, ".", function()
	local bottomRight = hs.geometry(0.5, 0.5, 0.5, 0.5)
	hs.window.focusedWindow():move(bottomRight)
end)

windowLayoutMode:bindWithAutomaticExit({}, "left", function()
	local left40 = hs.geometry(0, 0, 0.4, 1)
	hs.window.focusedWindow():move(left40)
end)

windowLayoutMode:bindWithAutomaticExit({}, "right", function()
	local right60 = hs.geometry(0.4, 0, 0.6, 1)
	hs.window.focusedWindow():move(right60)
end)

-- Use Hyper+return to toggle WindowLayout Mode
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "return", function()
	windowLayoutMode:enter()
end)
windowLayoutMode:bind({ "cmd", "alt", "ctrl", "shift" }, "return", function()
	windowLayoutMode:exit()
end)
