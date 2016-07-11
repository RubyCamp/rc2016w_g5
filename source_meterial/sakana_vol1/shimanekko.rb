class Shimanekko < Sprite
  def initialize(x, y, image)
#    @x, @y = x, y
#    @image = Image.load(image_file)
#    @image.set_color_key([0, 0, 0])
#    super(@x,@y,@image)
    self.x = x
    self.y = y
    image = Image.load(image)
    image.set_color_key([0, 0, 0])
    super
    @score = 0
  end

#  def draw
#    Window.draw(@x, @y, @image)
#  end
  def hit(obj)
    @score += 1
    puts @score
  end
	def update
#     @x, @y = Input.mouse_pos_x, Input.mouse_pos_y
     self.x = Input.mouse_pos_x
     self.y = Input.mouse_pos_y
  end
end
