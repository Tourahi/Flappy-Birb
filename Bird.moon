
GRAVITY = 20

class Bird
  new: () =>
    @image = Graphics.newImage 'bird.png'
    @width = @image\getWidth!
    @height = @image\getHeight!
    @x = VIRTUAL_WIDTH / 2 - (@width / 2)
    @y = VIRTUAL_HEIGHT / 2 - (@height / 2)
    @dy = 0

  update: (dt) =>
    @dy += GRAVITY * dt
    @y += @dy
    if Keyboard.wasPressed 'space'
      @dy = -5

  collides: (pipe) =>
    if (@x+2) + (@width-4) >= pipe.x and @x+2 <= pipe.x + PIPE_WIDTH
      if (@y+2) + (@height-4) >= pipe.y and @y+2 <= pipe.y + PIPE_HEIGHT
        return true
    return false
  draw: () =>
    Graphics.draw @image, @x, @y
    Graphics.rectangle 'line', @x+2, @y+2, @width - 4, @height-4
