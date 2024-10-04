local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x,y,rotationSpeed)
    local playerImage = gfx.image.new("images/pSprite")
    self:setImage(playerImage)
    self:moveTo(x,y)
    self:add()
    rSpeed = rotationSpeed
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        --self:moveBy(0,-1)
        self:setRotation((self:getRotation())+rSpeed)
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        --self:moveBy(0,1)
        self:setRotation((self:getRotation())+-rSpeed)
    end 

    if pd.buttonJustPressed(pd.kButtonA) then
        pRotation = self.getRotation
        Bullet(self.x,self.y,pRotation,5)
    end
end