PIPE_IMAGE = Graphics.newImage 'pipe.png'
PIPE_SCROLL = 60
export PIPE_HEIGHT = 288
export PIPE_WIDTH = 70
export PIPE_SPEED = 60
import random from math

class Pipe
  new: (oriantation, y) =>
    @x = VIRTUAL_WIDTH
    @y = y
    @width = PIPE_IMAGE\getWidth!
    @height = PIPE_IMAGE\getHeight!
    @oriantation = oriantation

  update: (dt) =>


  draw: () =>
    Graphics.draw PIPE_IMAGE, @x, @y,0 , 1,
			(@oriantation == 'top' and -1 or 1)
