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
    local IMG_PATH = "assets/german-shepherd.png"
    image = love.graphics.newImage(IMG_PATH)
    -- Toggle VSync on or off
    love.window.setVSync(1)
end

-- GRAPHICAL UPDATING FUNCTION --
function love.update(delta_time)
end

-- GRAPHICAL DRAWING FUNCTION --
function love.draw()
    love.graphics.draw(image, love.math.random(0, 800), love.math.random(0, 600))
end

-- DEFAULT GAME LOOP --
function love.run()
    if love.math then
        love.math.setRandomSeed(os.time())
    end

    if love.load then love.load(arg) end

    -- Ensure first frame's delta does not include processing time by `love.load()`
    if love.timer then love.timer.step() end

    local delta_time = 0

    -- MAIN GAME LOOP --
    while true do
        -- Process game events
        if love.event then
            love.event.pump()
            for name, arg1, arg2, arg3, arg4, arg5, arg6 in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return arg1
                    end
                end
                love.handlers[name](arg1, arg2, arg3, arg4, arg5, arg6)
            end
        end

        -- Update delta before passing to native updater
        if love.timer then
            love.timer.step()
            delta_time = love.timer.getDelta()
        end

        -- Invoke native updater and draw to game environment
        -- NOTE: Will pass zero-value to native updater if `love.timer` is disabled
        if love.update then love.update(delta_time) end

        if love.graphics and love.graphics.isActive() then
            love.graphics.clear(love.graphics.getBackgroundColor())
            love.graphics.origin()
            if love.draw then love.draw() end
            love.graphics.present()
        end
        
        local seconds = 0.0001
        if love.timer then love.timer.sleep(seconds) end
    end
end
