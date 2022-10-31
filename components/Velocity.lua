local Vector2 = require "helpers.Vector2"

local Velocity = {name="VELOCITY", direction = Vector2.New(0,0), speed = 0}

function Velocity:new(x,y)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    self.direction.x = x
    self.direction.y = y
    return o
end

function Velocity:normalized()
    local hyp = math.sqrt(self.x*self.x + self.y*self.y)
    self.x = self.x/hyp
    self.y = self.y/hyp
    return self.x, self.y
end

return Velocity