local Vector2 = require "helpers.Vector2"

local Position = {name="POSITION", location = Vector2.New(0,0)}

function Position:new(x, y)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    self.location.x = x
    self.location.y = y
    return o
end

return Position