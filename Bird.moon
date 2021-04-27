
class Bird
  new: () =>
    @image = Graphics.newImage 'bird.png'
    @width = @image\getWidth!
    @height = @image\getHeight!
    @x = VIRTUAL_WIDTH / 2 - (@width / 2)
    @y = VIRTUAL_HEIGHT / 2 - (@height / 2)

  draw: () =>
    Graphics.draw @image, @x, @y
