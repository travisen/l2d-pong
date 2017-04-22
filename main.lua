DEBUGGING = true -- true to turn debugging on.

function love.load()
  Object = require "lib/classic"
  require "game"
  
  music = love.audio.newSource("assets/staycrunchy.mp3")
  game = Game()
  music:play()
  
end
 
-- Update game objects
function love.update(dt)
  game:update(dt)
end
 
-- Draw a coloured rectangle.
function love.draw()
  game:draw()
end