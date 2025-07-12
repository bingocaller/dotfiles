local drawing = require("hs.drawing")
local screen = require("hs.screen")
local styledtext = require("hs.styledtext")

local statusmessage = {}
statusmessage.new = function(text, fontSize)
	local buildParts = function()
		local frame = screen.primaryScreen():fullFrame()

		local styledTextAttributes = {
			color = { hex = "fff" },
			font = { name = "MonaspiceNe Nerd Font Mono", size = fontSize or 192 },
			paragraphStyle = {
				alignment = "center",
			},
			shadow = {
				offset = {
					w = 2,
					h = -2,
				},
				blurRadius = 10,
				color = {
					hex = "000",
					alpha = 0.5,
				},
			},
		}

		local styledText = styledtext.new(text, styledTextAttributes)

		local styledTextSize = drawing.getTextDrawingSize(styledText)
		local paddedStyledTextWidth = styledTextSize.w + 40
		local paddedStyledTextHeight = styledTextSize.h + 20
		local textRect = {
			x = (frame.w / 2) - (paddedStyledTextWidth / 2),
			y = (frame.h / 2) - (paddedStyledTextHeight / 2),
			w = paddedStyledTextWidth,
			h = paddedStyledTextHeight,
			-- x = frame.w - styledTextSize.w - 40,
			-- y = frame.h - styledTextSize.h,
			-- w = styledTextSize.w + 40,
			-- h = styledTextSize.h + 40,
		}
		local foreground = drawing.text(textRect, styledText):setAlpha(0.9)

		local background = drawing.rectangle({
			x = 0,
			y = 0,
			w = frame.w,
			h = frame.h,
			-- x = frame.w - styledTextSize.w - 52, -- Magic number; getTextDrawingSize is not an exact science
			-- y = frame.h - styledTextSize.h,
			-- w = styledTextSize.w + 26,
			-- h = styledTextSize.h + 6
		})
		background:setFillColor({ hex = "000", alpha = 0.2 })
		-- background:setFillGradient(
		--	{
		--		red = 0,
		--		green = 0,
		--		blue = 0,
		--		alpha = .5
		--	},
		--	{
		--		red = 0,
		--		green = 0,
		--		blue = 0,
		--		alpha = .1
		--	}, 270)
		-- background:setFillColor({ hex = '3b3b3b' })
		-- background:setStrokeColor({ hex = '2d2d2d' })
		-- background:setStrokeWidth(10)

		return background, foreground
	end

	return {
		_buildParts = buildParts,
		show = function(self)
			self:hide()

			self.background, self.text = self._buildParts(text)
			self.background:show()
			self.text:show()
		end,
		hide = function(self)
			if self.background then
				self.background:delete()
				self.background = nil
			end
			if self.text then
				self.text:delete()
				self.text = nil
			end
		end,
		notify = function(self, seconds)
			seconds = seconds or 1
			self:show()
			hs.timer.delayed
				.new(seconds, function()
					self:hide()
				end)
				:start()
		end,
	}
end

return statusmessage
