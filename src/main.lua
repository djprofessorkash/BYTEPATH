--[[
Main Project File for BYTEPATH Cloning Challenge. 

The objective of this project is to successfully clone
a functioning version of the indie game BYTEPATH using
Lua and its relevant library, LÖVE.
]]--

-- GLOBAL DEBUGGING SCRIPTS --
if pcall(require, "lldebugger") then require("lldebugger").start() end
if pcall(require, "mobdebug") then require("mobdebug").start() end

-- GRAPHICAL LOADING FUNCTION --
function love.load()
    IMG_PATH = "assets/german-shepherd.png"
    image = love.graphics.newImage(IMG_PATH)
end

-- GRAPHICAL UPDATING FUNCTION --
function love.update(delta)
end

-- GRAPHICAL DRAWING FUNCTION --
function love.draw()
    love.graphics.draw(image, love.math.random(0, 800), love.math.random(0, 600))
end
