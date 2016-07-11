require 'dxruby'
require_relative 'scene'
require_relative 'scenes/load_scenes'

#require_relative 'director'

Scene.set_current_scene(:title)

bg_img = Image.load("images/kari.png")



Window.loop do
  Scene.play_scene
end