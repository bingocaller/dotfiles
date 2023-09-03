local message = require("NotSpoons.status-message")
---------------------
-- SPOTIFY
---------------------
local spotifyIcon = hs.image.imageFromAppBundle("com.spotify.client")
-- Setup Spotify message
local spotifyMessage = message.new("spotify", "Font Awesome 6 Brands")
spotifyMessage.hidden = function()
	spotifyMessage:hide()
end
local showSpotifyNotification = function()
	if hs.spotify.isPlaying() then
		local attributes = {
			title = hs.spotify.getCurrentTrack(),
			subTitle = hs.spotify.getCurrentArtist(),
			informativeText = hs.spotify.getCurrentAlbum(),
		}
		hs.notify.new(nil, attributes):contentImage(spotifyIcon, true):send()
	else
		-- Show Spotify logo, then hide it
		spotifyMessage:show()
		hs.timer.doAfter(1, spotifyMessage.hidden)
		-- hs.alert.show('Spotify')
		hs.application.launchOrFocus("Spotify")
	end
end
hs.hotkey.new({ "cmd", "alt", "ctrl", "shift" }, "s", showSpotifyNotification):enable()
