Ball = Object:extend()

function Ball:new()
  
  -- Spawn ball at center of screen
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.radius = 10
  
  --self.image = love.graphics.circle("fill", self.x, self.y, self.radius, 100)
  --assert(self.image ~= nil)
  
  --Initial Speed
  self.speedx = -400
  self.speedy = -400
end

function Ball:update(dt, paddle1, paddle2)
  -- Update position
  self.x = self.x + (self.speedx * dt)
  self.y = self.y + (self.speedy * dt)

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


function Ball:paddleCollision(p)
  -- Check for ball and paddle collision and update direction.
  -- Refactor this.
  --[[
  if p1y <= self.y and p1y + p1h >= self.y and p1x + p1w >= self.x + self.radius then
    print("TRUE")
  end
  --]]
  --top, right, bot, left = p:getBounds()
  --print(p.x, p.y, p.height, p.width)
  
  -- Paddle bounds.
  local pLeft = p.x
  local pRight = p.x + p.width
  local pTop = p.y 
  local pBot = p.y + p.height
  
  -- Ball bounds.
  local bLeft = self.x - self.radius
  local bRight = self.x + self.radius
  local bTop = self.y - self.radius
  local bBot = self.y + self.radius
  
  if bLeft < pRight and bRight > pLeft and bTop < pTop and bBot > pBot then
    print("bLeft ", bLeft , "bRight ", bRight,  "bTop ", bTop,  "bBot ", bBot)
    print("pLeft ", pLeft , "pRight ", pRight,  "pTop ", pTop,  "pBot ", pBot)
  end

  if bLeft < pRight and bRight > pLeft and bTop > pTop and bBot < pBot then
    self.speedx = -self.speedx
    print("hit")
  end
  
end

function Ball:draw(dt)
  --love.graphics.draw(self.image, self.x, self.y)
  self.ball = love.graphics.circle("fill", self.x, self.y, self.radius, 50)
end