Game = Object:extend()
require "paddle"
require "ball"

PADDLE_DIST_FROM_SCR = 60

function Game:new()
  
  -- Get x and y center of screen
  yCenter = love.graphics.getHeight()/2
  width = love.graphics.getWidth() - PADDLE_DIST_FROM_SCR
  center = love.graphics.getWidth()
  
  -- Load paddles
  paddle1 = Paddle(PADDLE_DIST_FROM_SCR - 10, yCenter, "default", false, "red", 700)
  paddle2 = Paddle(width, yCenter, "assets/paddle2.png", true, "blue", 1500)
  
  -- Load ball
  ball1 = Ball()
      
  self.scoreLeft = 0
  self.scoreRight = 0
end

function Game:update(dt)  
  
  paddle1:update(dt)
  --paddle2:update(dt)
  paddle2:trackBall(ball1, dt)
  
  ball1:update(dt, paddle1, paddle2)
  ball1:paddleCollision(paddle1)
  ball1:paddleCollision(paddle2)
  
  local ballStatus = ball1:checkOutOfBounds()
  
  if ballStatus == "left" then
    self.scoreRight = self.scoreRight + 1
    ball1 = Ball() -- Respawn ball
  elseif ballStatus == "right" then
    self.scoreLeft = self.scoreLeft + 1
    ball1 = Ball() -- Respawn ball
  end  
end


function Game:draw()
  
  for i=0, 10 do
    love.graphics.rectangle("fill", 760, 80 * i, 20, 60)
  end
    
  love.graphics.setColor(244, 0, 0)
  paddle1:draw()
  love.graphics.setColor(0, 0, 244)
  paddle2:draw()
  love.graphics.setColor(255, 255, 255)
  ball1:draw()  
  love.graphics.print(self.scoreLeft .. " - " .. self.scoreRight, 712, 20, 0, 4, 4)
  
end