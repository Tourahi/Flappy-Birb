math.randomseed os.time!
export Push = assert require 'libs.push'
export B = assert require 'libs.Binocles'
export WINDOW_WIDTH = 1280
export WINDOW_HEIGHT = 720
export VIRTUAL_WIDTH = 512
export VIRTUAL_HEIGHT = 288

import floor from math
import insert from table
import remove from table
import max from math
import min from math
import random from math

export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
Keyboard.keysPressed = {}

Bird = assert require 'Bird'
bird = Bird!


Pipe = assert require 'Pipe'

PipePair = assert require 'PipePair'

pipePaires = {}
lastY = -PIPE_HEIGHT + math.random(80) + 20

spawnTimer = 0

background = Graphics.newImage 'background.png'
backgroundScroll = 0
ground = Graphics.newImage 'ground.png'
groundScroll = 0

BACKGROUND_SCROLL_SPEED = 30
GROUND_SCROLL_SPEED = 60

BACKGROUND_LOOPING_POINT = 413

windowOptions = {
  vsync: true,
  fullscreen: false,
  resizable: true
}

with love
  .load = () ->
    B!
    Graphics.setDefaultFilter 'nearest', 'nearest'
    Window.setTitle 'Flappy Birb'
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
      WINDOW_WIDTH, WINDOW_HEIGHT, windowOptions
    B\watch "backgroundScroll",-> backgroundScroll
    B\watch "groundScroll",-> groundScroll

  .resize = (w,h) ->
    Push\resize w,h

  .update = (dt) ->
    B\update dt
    spawnTimer += dt
    if spawnTimer > 2
      y = max(-PIPE_HEIGHT + 10, min(lastY + random(-20, 20), VIRTUAL_HEIGHT - 90 - PIPE_HEIGHT))
      lastY = y
      insert pipePaires, PipePair y
      spawnTimer = 0

    for _, pair in pairs pipePaires
      pair\update dt

    for _, pair in pairs pipePaires
      if pair.remove
        remove pipePaires, _

    backgroundScroll =  (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
    bird\update dt
    Keyboard.keysPressed = {}

  .keypressed = (key) ->
    Keyboard.keysPressed[key] = true
    if key == 'escape'
      love.event.quit!

  .keyboard.wasPressed = (key) ->
    if Keyboard.keysPressed[key]
      return true
    else
      return false

  .draw = () ->
    Push\start!
    Graphics.draw background,-backgroundScroll,0

    for _, pair in pairs pipePaires
      pair\draw!

    Graphics.draw ground,-groundScroll,VIRTUAL_HEIGHT - 16
    bird\draw!
    Push\finish!
    B\draw!


