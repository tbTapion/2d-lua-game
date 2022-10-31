local Vector2 = {}

function Vector2.New(x1, y1)
  local o = {x = x1, y = y1}
  setmetatable(o,Vector2)
  Vector2.__index = Vector2
  return o
end

function Vector2:clone()
  return Vector2.New(self.x, self.y)
end

function Vector2:len2()
  return self.x*self.x + self.y*self.y
end

function Vector2:len()
  return math.sqrt(self:len2())
end

function Vector2:Normalized()
  local len = self:len()
  return Vector2.New(self.x/len, self.y/len)
end

return Vector2