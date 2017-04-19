-- Load some default values for our rectangle.
function love.load()
  Object = require "lib/classic"
  require "paddle"
  
  --paddle1 = love.graphics.newImage("assets/paddle1.png")
  --paddle2 = love.graphics.newImage("assets/paddle2.png")
  
  yCenter = love.graphics.getHeight()/2
  width = love.graphics.getWidth() - 30
  
  paddle1 = Paddle(30, yCenter, "assets/paddle1.png", false)
  paddle2 = Paddle(width, yCenter, "assets/paddle2.png", true)
end
 
-- Increase the size of the rectangle every frame.
function love.update(dt)
  paddle1:update(dt)
  paddle2:update(dt)
end
 
-- Draw a coloured rectangle.
function love.draw()
  paddle1:draw()
  paddle2:draw()
end