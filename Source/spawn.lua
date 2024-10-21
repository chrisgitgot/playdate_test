import 'CoreLibs/sprites'

local pd <const> = playdate
local gfx <const> = pd.graphics
local geo <const> = pd.geometry

class('Spawn').extends(gfx.sprite)


function Spawn:init(x,y)
    --[[local BulletSpawnImage = gfx.image.new("images/bulletSprite")
    self:setImage(BulletSpawnImage)
    self:moveTo(x,y)
    self:add()]]
    local size = 4
    local spawnImg = gfx.image.new(size * 2, size * 2)
    gfx.pushContext(spawnImg)
        gfx.drawCircleAtPoint(size, size, size)
    gfx.popContext()
    self:setImage(spawnImg)
    self:moveTo(x,y)
end

function Spawn:update()
    local crankAngle = pd.getCrankPosition() - 90
    self:setRotation(geo.affineTransform:rotatedBy(crankAngle, 100, 200) - 90)
    Player:UpdateSpawn(self.x, self.y)
end

