import 'CoreLibs/sprites'

local pd <const> = playdate
local gfx <const> = pd.graphics
bulletspeed = 5

class('Player').extends(gfx.sprite)

function Player:init(x,y)
    local playerImage = gfx.image.new("images/pSprite")
    self:setImage(playerImage)
    self:moveTo(x,y)
    self:add()
    self.dx = 0
    self.dy = 0
    self.angle = 0
    bx = self.x + 10
    by = self.y
end

function Player:update()
    self:setRotation(pd.getCrankPosition() - 90)
    self.angle = (pd.getCrankPosition() - 90)
    local dx = self.dx + bulletspeed * math.cos(math.rad(self.angle))
    local dy = self.dy + bulletspeed * math.sin(math.rad(self.angle))
    if pd.buttonJustPressed(pd.kButtonB) then
        local b = Bullet:new()
		b:moveTo(spawnX, spawnY)
		b:setVelocity(self.dx + bulletspeed * math.cos(math.rad(self.angle)), self.dy + bulletspeed * math.sin(math.rad(self.angle)))
		b:addSprite()
    end
end

function UpdateSpawn(x,y)
    spawnX = x
    spawnY = y
end