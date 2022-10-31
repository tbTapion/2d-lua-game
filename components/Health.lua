local Health = {name="HEALTH", health = 0, max = 0, alive = true}

function Health:new(health, max)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    self.health = health
    if max == nil then
        self.max = health
    else
        self.max = max
    end
    return o
end

function Health:reduce(points)
    self.health = math.max(self.health - points, 0)
    if self.health == 0 then
        self.alive = false
    end
end

function Health:increase(points)
    self.health = math.min(self.health + points, self.max)
end

function Health:reduceMax(points)
    self.max = math.max(self.max - points, 0)
    if self.health > self.max then
        self.health = self.max
    end
end

function Health:increaseMax(points)
    self.max = self.max + points
end

return Health