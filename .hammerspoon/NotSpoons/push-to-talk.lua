hs.loadSpoon("SpoonInstall")

---------------------
-- PUSH-TO-TALK
---------------------
spoon.SpoonInstall:andUse("MicMute")
spoon.MicMute:bindHotkeys({ toggle = { { "cmd", "alt", "ctrl", "shift" }, "=" } })
