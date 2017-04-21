Ball = Object:extend()

function Ball:new()
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.radius = 10
  
  --self.image = love.graphics.circle("fill", self.x, self.y, self.radius, 100)
  --assert(self.image ~= nil)
  
  --Initial Speed
  self.speedx = 400
  self.speedy = 400
end

function Ball:update(dt)  
  -- Get Window bounds
  local window_width = love.graphics.getWidth()  
  local window_height = love.graphics.getHeight()
  
  -- Update position
  self.x = self.x + (self.speedx * dt)
  self.y = self.y + (self.speedy * dt)
  
  -- Update direction of speed vector on Window Collision
  if self.y > window_height or self.y < 0 then
    self.speedy = -self.speedy
  elseif self.x > window_width or self.x < 0 then
    self.speedx = -self.speedx
  end  
end

function Ball:paddleCollision(dt)

end
  

function Ball:draw(dt)
  --love.graphics.draw(self.image, self.x, self.y)
  self.ball = love.graphics.circle("fill", self.x, self.y, self.radius, 500)
end