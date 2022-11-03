local managers = require("managers")
local Vector2 = require("helpers.Vector2")
local EntityManager, ComponentManager, SystemManager = managers[1], managers[2], managers[3]

--[[
x, y, w, h = 50, 50, 100, 100

function love.load()
    print("Loading nothing yet")
end

function love.update(dt)
    x = x + (60*dt)
end

function love.draw()
    love.graphics.setColor(0,0.5,0.5)
    love.graphics.rectangle("fill", x, y, w, h)
end]]--

function Err(x)
    local errMsg = "Error: " .. x
    return errMsg
end

function LoadMods()
    local dir = love.filesystem.getSourceBaseDirectory()
    print(dir .. "/mods/ModFactory.lua")
    return love.filesystem.load(dir .. "/mods/ModFactory.lua") or love.filesystem.load("mods/ModFactory.lua")
end

ModFactory = LoadMods() or function() return {x=50, y=50} end

print(ModFactory)

mods = ModFactory()


function love.load()
    local test = Vector2.New(100,100)
    rectwidth = mods.x
    rectheight = mods.y

    -- arguments are: x, y, angle, scalex, scaley, offsetx, offsety
    transform = love.math.newTransform(200, 200, math.pi/4, 1, 1, rectwidth / 2, rectheight / 2)
end

angle = 0

function love.draw()
    transform:rotate(angle)
    angle = 0.01
    love.graphics.applyTransform(transform)
    love.graphics.rectangle("fill", -(rectwidth/2), -(rectheight/2), rectwidth, rectheight)
end