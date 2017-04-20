-- Load some default values for our rectangle.

DEBUGGING = 0 -- 1 to turn debuggin on.

function love.load()
  Object = require "lib/classic"
  require "paddle"
  require "ball"
  
  -- Get x and y center of screen
  yCenter = love.graphics.getHeight()/2
  width = love.graphics.getWidth() - 30
  
  -- Load paddles
  paddle1 = Paddle(20, yCenter, "default", false, "red")
  paddle2 = Paddle(width - 30, yCenter, "assets/paddle2.png", true, "blue")
  
  -- Load ball
  ball1 = Ball()
end
 
-- Update game objects
function love.update(dt)
  paddle1:update(dt)
  paddle2:update(dt)
  ball1:update(dt)
end
 
-- Draw a coloured rectangle.
function love.draw()
  love.graphics.setColor(244, 0, 0)
  paddle1:draw()
  love.graphics.setColor(0, 0, 244)
  paddle2:draw()
  love.graphics.setColor(255, 255, 255)
  ball1:draw()
end