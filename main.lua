-- Load some default values for our rectangle.

DEBUGGING = 0 -- 1 to turn debuggin on.

function love.load()
  Object = require "lib/classic"
  require "paddle"
  require "ball"
  require "game"
  
  game = Game()
  
end
 
-- Update game objects
function love.update(dt)
  game:update(dt)
end
 
-- Draw a coloured rectangle.
function love.draw()
  game:draw()
end