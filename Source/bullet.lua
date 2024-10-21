local gfx = playdate.graphics

Bullet = {}
Bullet.__index = Bullet

function Bullet:new()
	local self = playdate.graphics.sprite:new()
	
	self:setSize(3, 3)
	self:setCollideRect(0, 0, 3, 3)
	
	function self:setVelocity(dx, dy, da)
		self.dx = dx
		self.dy = dy
	end
	
	function self:update()
		local x,y,c,n = self:moveWithCollisions(self.x + self.dx, self.y + self.dy)
	end

	function self:draw()
		gfx.setColor(gfx.kColorBlack)
		gfx.fillRect(0, 0, 30, 30)
	end
	
	function self:collisionResponse(other)
		return "overlap"
	end

	return self
end
