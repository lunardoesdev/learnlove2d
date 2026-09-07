function love.draw()
    local x,y = love.mouse.getPosition()
    love.graphics.circle("fill", x, y, 20)
end
