Paddle = Object:extend()

function Paddle:new(x, y, img, ai)
  self.x = x
  self.y = y
  
  self.image = love.graphics.newImage(img)  
  self.ai = ai
  self.speed = 500
end

function Paddle:update(dt)
  if love.keyboard.isDown("up") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("down") then
    self.y = self.y + self.speed * dt
  end
end

function Paddle:draw()
  love.graphics.draw(self.image, self.x, self.y)
end