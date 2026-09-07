local pins = {}

local balls = {}
balls[1] = {
    x = 400,
    y = 50,
    vy = 0,
    vx = 0,
    radius = 10
}

local function deepcopy(orig)
    if type(orig) ~= "table" then return orig end
    local copy = {}
    for k, v in pairs(orig) do
        copy[deepcopy(k)] = deepcopy(v)
    end
    return copy
end

for i = 2, 50 do
    balls[i] = deepcopy(balls[1])
end

local gravity = 500

function love.load()
    for row = 1, 8 do
        for col = 1, row + 2 do
            local x = 400 + (col - (row + 3) / 2) * 75
            local y = 100 + row * 45
            table.insert(pins, {x = x, y = y})
        end
    end
end

function love.update(dt)
    for _, ball in ipairs(balls) do
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

        for _, ball2 in ipairs(balls) do
            if (ball2 ~= ball) then
                local dx = ball.x - ball2.x
                local dy = ball.y - ball2.y
                local dist = math.sqrt(dx * dx + dy * dy)
                if (dist < ball.radius + ball2.radius) then
                    ball.vy = (dy > 0 and 1 or -1) * 100 + math.random(-50, 50)
                    ball.vx = (dx > 0 and 1 or -1) * 200 + math.random(-50, 50)
                    ball.y = ball.y + ball.vy * dt
                    ball.x = ball.x + ball.vx * dt
                end
            end
        end

        if ball.y > 620 then
            ball.y = 50
            ball.vy = 0
            ball.x = 400 + math.random(-50, 50)
        end

        if ball.x < 20 or ball.x > 780 then ball.vx = -ball.vx end
    end
end

function love.draw()
    local x,y = love.mouse.getPosition()
    love.graphics.circle("fill", x, y, 20)

    for _, p in ipairs(pins) do
        love.graphics.circle("fill", p.x, p.y, 5)
    end

    for _, ball in ipairs(balls) do
        love.graphics.circle("fill", ball.x, ball.y, ball.radius)
    end
end

function love.keypressed(key)

end
