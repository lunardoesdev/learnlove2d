function love.load()
  love.graphics.setFont(love.graphics.newFont(42))
end

function love.update(dt)

end

function love.draw()
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    local rectH = h * 0.2
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("fill", 0, h - rectH, w, rectH)

    love.graphics.print("Hello, Love2d", 300, 300)
end
