local pd <const> = playdate
local gfx <const> = pd.graphics

class('Bullet').extends(gfx.sprite)

function Bullet:init(x,y,r,speed)
    local bulletSize = 4
    local bulletImg = gfx.image.new(bulletSize * 2, bulletSize * 2)
    gfx.pushContext(bulletImg)
        gfx.drawCircleAtPoint(bulletSize,bulletSize,bulletSize)
    gfx.popContext()
    self:setImage(bulletImg)

    self:setCollideRect(0,0,self:getSize())
    self.speed = speed
    self:moveTo(x,y)
    self:add()

    --self.setRotation(0)
end

function Bullet:update()
    self:moveWithCollisions(self.x + self.speed, self.y)
end