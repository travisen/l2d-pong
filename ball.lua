Ball = Object:extend()

function Ball:new()
  
  -- Spawn ball at center of screen
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.radius = 10
  self.segments = 30
  
  --self.image = love.graphics.circle("fill", self.x, self.y, self.radius, 100)
  --assert(self.image ~= nil)
  
  --Initial Speed
  
  -- Randomize initial direction
  number = love.math.random()
  if number < .5 then
    self.speedx = -400
    self.speedy = -400
  elseif number > .5 then
    self.speedx = 400
    self.speedy = 400
  end

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
  --print(self.x, self.y)
  return self.x, self.y
end


-- Check if collision with left or right of screen.
function Ball:checkOutOfBounds()
  if self.x - self.radius < 0 then
    return "left"
  elseif self.x + self.radius > love.graphics.getWidth() then
    return "right"
  else
    return false
  end
end


function Ball:paddleCollision(p)
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
  
  if bLeft < pRight
    and bRight > pLeft
    and bTop > pTop
    and bBot < pBot then      
      self.speedx = -self.speedx +  -self.speedx*.05 -- self.speedx*.1 increases ball speed by 5% each paddle collision
  end
  
end

function Ball:draw(dt)
  --love.graphics.draw(self.image, self.x, self.y)
  self.ball = love.graphics.circle("fill", self.x, self.y, self.radius, self.segments)
end