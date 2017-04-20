Paddle = Object:extend()

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
  
  Paddle:getBounds()
    
  if not self.ai then
    if love.keyboard.isDown("up") and top >= window_height  then
      self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then
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