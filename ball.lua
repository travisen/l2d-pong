

Ball = Object:extend()

function Ball:new()
  
  -- Spawn ball at center of screen
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.radius = 10
  
  --self.image = love.graphics.circle("fill", self.x, self.y, self.radius, 100)
  --assert(self.image ~= nil)
  
  --Initial Speed
  self.speedx = 400
  self.speedy = 400
end

function Ball:update(dt, paddle1, paddle2)
  -- Update position
  self.x = self.x + (self.speedx * dt)
  self.y = self.y + (self.speedy * dt)

  local p1x, p1y = paddle1:getPosition()
  local p2x, p2y = paddle2:getPosition()
  local p1h, p1w = paddle1:getDimensions()
  local p2h, p2w = paddle2:getDimensions()

  -- Get Window bounds
  local window_width = love.graphics.getWidth()  
  local window_height = love.graphics.getHeight()

  -- Update direction of speed vector on Window Collision
  if self.y > window_height or self.y < 0 then
    self.speedy = -self.speedy
  elseif self.x > window_width or self.x < 0 then
    self.speedx = -self.speedx
  end
  
end

function Ball:getPosition()
  print(self.x, self.y)
  return self.x, self.y
end
--[[
function Ball:paddleCollision(dt, paddle1, paddle2, bx, by, bradius, speedx)
  p1x, p1y = paddle1:getPosition()
  p2x, p2y = paddle2:getPosition()
  p1h, p1w = paddle1:getDimensions()
  p2h, p2w = paddle2:getDimensions()

  --self.getPosition()
  
  if DEBUGGING then
    --print("paddle1: ", p1x, p1y)
    --print("paddle2: ", p2x, p2y)
    --print("ball1: ", bx, by)
  end

  if p1y <= by and p1y + p1h >= by and p1x + p1w >= bx + bradius then
    print("TRUE")
  end
  
end
--]]
function Ball:paddleCollision(paddle)
  -- Check for ball and paddle collision and update direction.
  -- Refactor this.
  --[[
  if p1y <= self.y and p1y + p1h >= self.y and p1x + p1w >= self.x + self.radius then
    print("TRUE")
    
  end
  --]]
  
end

function Ball:draw(dt)
  --love.graphics.draw(self.image, self.x, self.y)
  self.ball = love.graphics.circle("fill", self.x, self.y, self.radius, 500)
end