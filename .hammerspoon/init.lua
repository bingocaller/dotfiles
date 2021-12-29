local message = require('NotSpoons/status-message')

hs.loadSpoon('SpoonInstall')

---------------------
-- ALERT STYLING
---------------------
hs.alert.defaultStyle = {
  fillColor = {
    hex = '2d2d2d', -- Looks like #3b3b3b
    alpha = 1
  },
  radius = 0,
  strokeColor = {
    hex = '222', -- Looks like #2d2d2d
    alpha = 1
  },
  strokeWidth = 12,
  textColor = {
    hex = 'ececec', -- Looks like #f0f0f0
    alpha = 1
  },
  textFont  = "JetBrainsMono Nerd Font",
  textSize  = 24,
  atScreenEdge = 0,
  fadeInDuration = 0.15,
  fadeOutDuration = 0.15,
}
---------------------
-- HYPER BINDINGS
---------------------
hyper = require('NotSpoons/hyper')

---------------------
-- MARKDOWN MODE
---------------------
-- markdown = require('NotSpoons/markdown')

---------------------
-- WINDOW MANAGEMENT
---------------------
windows = require('NotSpoons/windows')

---------------------
-- CAFFEINE
---------------------
local caffeineOn = false
local toggleCaffeine = function()
    if not spoon.Caffeine then
      spoon.SpoonInstall:andUse('Caffeine')
    end
    caffeineOn = not caffeineOn
    spoon.Caffeine:setState(caffeineOn)
  end
hs.hotkey.new({'cmd', 'alt', 'ctrl', 'shift'}, 'c', toggleCaffeine):enable()
-- spoon.Caffeine.clicked()

---------------------
-- PUSH-TO-TALK
---------------------
spoon.SpoonInstall:andUse('MicMute')
spoon.MicMute:bindHotkeys({toggle = {{'cmd', 'alt', 'ctrl', 'shift'}, '='}})

---------------------
-- SPOTIFY
---------------------
local spotifyIcon = hs.image.imageFromAppBundle('com.spotify.client')
-- Setup Spotify message
local spotifyMessage = message.new('spotify', 'Font Awesome 6 Brands')
spotifyMessage.hidden = function()
  spotifyMessage:hide()
end
local showNotification = function()
  if hs.spotify.isRunning() then
    local attributes = {
			title = hs.spotify.getCurrentTrack(),
      subTitle = hs.spotify.getCurrentArtist(),
      informativeText = hs.spotify.getCurrentAlbum()
    }
    hs.notify.new(nil, attributes):setIdImage(spotifyIcon):send()
  else
    -- Show reload config message, then hide it
    spotifyMessage:show()
    hs.timer.doAfter(1, spotifyMessage.hidden)
    -- hs.alert.show('Spotify')
    hs.application.launchOrFocus('Spotify')
  end
end
hs.hotkey.new({'cmd', 'alt', 'ctrl', 'shift'}, 's', showNotification):enable()

---------------------
-- FLUX
---------------------
-- Setup Flux message
local fluxActiveMessage = message.new('sunset')
local fluxInactiveMessage = message.new('sunrise')
fluxActiveMessage.hidden = function()
  fluxActiveMessage:hide()
end
fluxInactiveMessage.hidden = function()
  fluxInactiveMessage:hide()
end
local toggleFlux = function()
  flux = hs.application.get('Flux')
  if flux then
    fluxInactiveMessage:show()
    hs.timer.doAfter(1, fluxInactiveMessage.hidden)
    flux:kill()
    -- hs.alert.show('Killed Flux')
  else
    -- hs.alert.show('Flux')
    fluxActiveMessage:show()
    hs.timer.doAfter(1, fluxActiveMessage.hidden)
    hs.application.launchOrFocus('Flux')
  end
end
hs.hotkey.new({'cmd', 'alt', 'ctrl', 'shift'}, 'l', toggleFlux):enable()

---------------------
-- RELOAD CONFIG
---------------------
-- Setup reload config message
local reloadConfigMessage = message.new('arrows-rotate', 'Font Awesome 6 Pro Solid')
reloadConfigMessage.hidden = function()
  reloadConfigMessage:hide()
end
-- Use Hyper+` to reload Hammerspoon config
hs.hotkey.new({'cmd', 'alt', 'ctrl', 'shift'}, '`', function()
  hs.reload()
	-- Show reload config message, then hide it
	reloadConfigMessage:show()
	hs.timer.doAfter(1, reloadConfigMessage.hidden)
end):enable()
-- Auto-reload
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
-- hs.alert.show('Config loaded')
