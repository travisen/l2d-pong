Paddle = Object:extend()

local paddlePad = 10 -- Prevents part of paddle from moving off screen.

function Paddle:new(x, y, img, ai, color)
  self.x = x
  self.y = y
  self.style = "line"
  self.width = 15
  self.height = 150

  -- Load image or love rectangle
  if img ~= "default" then
    self.paddle = love.graphics.newImage(img)
  end
  
  self.ai = ai
  self.speed = 500
end

function Paddle:update(dt)
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()
  
  if self.x > window_height then
    --print("position > window_height")
  end
  
  --print("y of paddle:" .. self.y)
  
  if not self.ai then
    if love.keyboard.isDown("up") and self.y - paddlePad > 0 then
      self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") and self.y + self.height + paddlePad < window_height then
      self.y = self.y + self.speed * dt
    end
  end
end

function Paddle:getBounds()
  top = self.y
  right = self.x + self.width
  bot = self.y + self.height
  left = self.x 
end

function Paddle:draw()
  love.graphics.rectangle(self.style, self.x, self.y, self.width, self.height)
end