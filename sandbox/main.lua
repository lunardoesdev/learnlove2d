local pins = {}

function love.load()
    for row = 1, 8 do
        for col = 1, row + 2 do
            local x = 400 + (col - (row + 2) / 2) * 50
            local y = 100 + row * 45
            table.insert(pins, {x = x, y = y})
        end
    end
end


function love.draw()
    local x,y = love.mouse.getPosition()
    love.graphics.circle("fill", x, y, 20)

    for _, p in ipairs(pins) do
        love.graphics.circle("fill", p.x, p.y, 5)
    end
end
