GAP_HEIGHT = 90
Pipe = assert require 'Pipe'

class PipePair
  new: (y) =>
    @x = VIRTUAL_WIDTH + 32
    @y = y
    @pipes = {
      ['upper']: Pipe('top', @y + PIPE_HEIGHT),
      ['lower']: Pipe('bottom', @y + PIPE_HEIGHT + GAP_HEIGHT)
    }
    @remove  = false

  update: (dt) =>
    if @x > -PIPE_WIDTH
      @x -= PIPE_SPEED * dt
      @pipes['lower'].x = @x
      @pipes['upper'].x = @x
    else
      @remove = true

  draw: () =>
    for _, pipe in pairs @pipes
      pipe\draw!
