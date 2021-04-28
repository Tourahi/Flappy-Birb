PIPE_IMAGE = Graphics.newImage 'pipe.png'
PIPE_SCROLL = -60
import random from math

class Pipe
  new: () =>
    @x = VIRTUAL_WIDTH
    @y = random VIRTUAL_HEIGHT/4, VIRTUAL_HEIGHT - 10
    @width = PIPE_IMAGE\getWidth!

  update: (dt) =>
    @x += PIPE_SCROLL * dt

  draw: () =>
    Graphics.draw PIPE_IMAGE, @x, @y
