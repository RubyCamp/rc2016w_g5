require_relative 'scene_util'
require_relative 'title/director'
require_relative 'scene1/director'
require_relative 'scene2/director'
require_relative 'scene3/director'
require_relative 'end1/director'
require_relative 'end2/director'

Scene.add_scene(Title::Director.new,  :title)
Scene.add_scene(Scene1::Director.new,  :scene1)
Scene.add_scene(Scene2::Director.new,  :scene2)
Scene.add_scene(Scene3::Director.new,  :scene3)
Scene.add_scene(End1::Director.new,  :end1)
Scene.add_scene(End2::Director.new,  :end2)