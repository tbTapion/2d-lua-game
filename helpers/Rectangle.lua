local Vector2 = require "helpers.Vector2"

local Rectangle = {}

function Rectangle.New(x1, y1, w1, h1)
    local o = {location = Vector2.New(x1,y1), dimensions = Vector2.New(w1, h1)}
    setmetatable(o,Rectangle)
    Rectangle.__index = Rectangle
    return o
end

return Rectangle