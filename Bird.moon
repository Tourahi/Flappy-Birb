
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

  draw: () =>
    Graphics.draw @image, @x, @y
