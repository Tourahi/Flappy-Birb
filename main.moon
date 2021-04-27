
export Push = assert require 'libs.push'

export WINDOW_WIDTH = 1280
export WINDOW_HEIGHT = 720
export VIRTUAL_WIDTH = 512
export VIRTUAL_HEIGHT = 288

Graphics = love.graphics
Window = love.window
background = Graphics.newImage 'background.png'
backgroundScroll = 0
ground = Graphics.newImage 'ground.png'
groundScroll = 0

BACKGROUND_SCROLL_SPEED = 30
GROUND_SCROLL_SPEED = 30

windowOptions = {
  vsync: true,
  fullscreen: false,
  resizable: true
}

with love
  .load = () ->
    Graphics.setDefaultFilter 'nearest', 'nearest'
    Window.setTitle 'Flappy Berb'
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
      WINDOW_WIDTH, WINDOW_HEIGHT, windowOptions

  .resize = (w,h) ->
    Push\resize w,h

  .keypressed = (key) ->
    if key == 'escape'
      love.event.quit!

  .draw = () ->
    Push\start!
    Graphics.draw background,-backgroundScroll,0
    Graphics.draw ground,-groundScroll,VIRTUAL_HEIGHT - 16
    Push\finish!


