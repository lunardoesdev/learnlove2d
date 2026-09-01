function love.load()
  love.graphics.setFont(love.graphics.newFont(42))
  love.window.setMode(800, 600, {resizable = true})
end

function love.update(dt)

end

function love.draw()
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    local plinkoScreenSize = math.min(h * 0.8, w)
    local vpad = 0.5 * (h * 0.8 - plinkoScreenSize)
    local plinkoWidget = {
        width = plinkoScreenSize,
        height = plinkoScreenSize,
        x = 0.5 * (w - plinkoScreenSize),
        y = 0
    }

    local rectH = h - plinkoScreenSize
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("fill", 0, h - rectH, w, rectH)

    love.graphics.setColor(0.1, 0.1, 0.1)
    love.graphics.rectangle("fill", plinkoWidget.x, plinkoWidget.y, plinkoWidget.width, plinkoWidget.height)



    local font = love.graphics.getFont()
    local text = "Hello, Love2D"
    local tw = font:getWidth(text)
    local th = font:getHeight(text)

    love.graphics.print(text, (w - tw) / 2, (h - th) / 2)
end
