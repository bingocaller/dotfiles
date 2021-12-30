--- === MicMute ===
---
--- Microphone Mute Toggle and status indicator
---
--- Download: [https://github.com/dctucker/Spoons/raw/master/Spoons/MicMute.spoon.zip](https://github.com/dctucker/Spoons/raw/master/Spoons/MicMute.spoon.zip)

local M = {}
M.__index = M

-- Metadata
M.name = "MicMute"
M.version = "1.0"
M.author = "dctucker <dctucker@github.com>"
M.homepage = "https://dctucker.com"
M.license = "MIT - https://opensource.org/licenses/MIT"

function M:updateMicMute(mute)
  -- Setup message
  local message = require("../NotSpoons/status-message")
  local micOn = message.new("microphone", "Font Awesome 6 Pro Solid")
  local micOff = message.new("microphone-slash", "Font Awesome 6 Pro Solid")
  micOn.hidden = function()
    micOn:hide()
  end
  micOff.hidden = function()
    micOff:hide()
  end

  local muted
  if mute == -1 then
    muted = hs.audiodevice.defaultInputDevice():muted()
  end
  if muted then
    micOff:show()
    hs.timer.doAfter(1, micOff.hidden)
    -- obj.mute_menu:setTitle("📵 Muted")
  else
    micOn:show()
    hs.timer.doAfter(1, micOn.hidden)
    -- obj.mute_menu:setTitle("🎙 On")
  end
end

--- MicMute:toggleMicMute()
--- Method
--- Toggle mic mute on/off
---
function M:toggleMicMute()
  local mic = hs.audiodevice.defaultInputDevice()
  if mic:muted() then
    mic:setMuted(false)
  else
    mic:setMuted(true)
  end
  M:updateMicMute(-1)
end

--- MicMute:bindHotkeys(mapping, latch_timeout)
--- Method
--- Binds hotkeys for MicMute
---
--- Parameters:
---  * mapping - A table containing hotkey modifier/key details for the following items:
---   * toggle - This will cause the microphone mute status to be toggled. Hold for momentary, press quickly for toggle.
function M:bindHotkeys(mapping)
  if self.hotkey then
    self.hotkey:delete()
  end
  local mods = mapping["toggle"][1]
  local key = mapping["toggle"][2]

  self.hotkey = hs.hotkey.bind(mods, key, function()
    self:toggleMicMute()
  end)

  return self
end

function M:init()
  hs.audiodevice.watcher.setCallback(function(arg)
    if string.find(arg, "dIn ") then
      M:updateMicMute(-1)
    end
  end)
  hs.audiodevice.watcher.start()
end

return M
