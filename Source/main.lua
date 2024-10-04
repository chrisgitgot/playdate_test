-- import other scripts
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "bullet"

-- create master variables
local pd <const> = playdate
local gfx <const> = pd.graphics
local sw, sh <const> = pd.display.getSize()
local mx, my <const> = (sw/2), (sh/2)
local snd <const> = pd.sound

Player(mx,my,5)

-- first function to run
local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	gfx.setFont(font) -- DEMO
end


loadGame()

-- update functions
function pd.update()
	gfx.sprite.update()
	pd.drawFPS(0,0) -- FPS widget
end