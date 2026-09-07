local pins = {}

local ball = {
    x = 400,
    y = 50,
    vy = 0,
    vx = 0,
    radius = 10
}

local gravity = 500

function love.load()
    for row = 1, 8 do
        for col = 1, row + 2 do
            local x = 400 + (col - (row + 2) / 2) * 50
            local y = 100 + row * 45
            table.insert(pins, {x = x, y = y})
        end
    end
end

function love.update(dt)
    ball.vy = ball.vy + gravity * dt
    ball.y = ball.y + ball.vy * dt
    ball.x = ball.x + ball.vx * dt

    for _, p in ipairs(pins) do
        local dx = ball.x - p.x
        local dy = ball.y - p.y
        local dist = math.sqrt(dx * dx + dy * dy)
        if (dist < ball.radius + 5) then
            ball.vy = -ball.vy * 0.5
            ball.vx = (dx > 0 and 1 or -1) * 100 + math.random(-20, 20)
        end
    end

    if ball.y > 620 then
        ball.y = 50
        ball.vy = 0
        ball.x = 400 + math.random(-50, 50)
    end
end

function love.draw()
    local x,y = love.mouse.getPosition()
    love.graphics.circle("fill", x, y, 20)

    for _, p in ipairs(pins) do
        love.graphics.circle("fill", p.x, p.y, 5)
    end

    love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end

function love.keypressed(key)
    if key == "r" then
        ball.x = 400
        ball.y = 50
        ball.vx = 0
        ball.vy = 0
    end
end
