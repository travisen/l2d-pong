Game = Object:extend()
require "paddle"
require "ball"

function Game:new()
  
  -- Get x and y center of screen
  yCenter = love.graphics.getHeight()/2
  width = love.graphics.getWidth() - 30
  
  -- Load paddles
  paddle1 = Paddle(20, yCenter, "default", false, "red")
  paddle2 = Paddle(width - 30, yCenter, "assets/paddle2.png", true, "blue")
  
  -- Load ball
  ball1 = Ball()
end

function Game:update(dt)
  
  paddle1:update(dt)
  paddle2:update(dt)
  ball1:update(dt)
  
end

function Game:draw()
  love.graphics.setColor(244, 0, 0)
  paddle1:draw()
  love.graphics.setColor(0, 0, 244)
  paddle2:draw()
  love.graphics.setColor(255, 255, 255)
  ball1:draw()  
end