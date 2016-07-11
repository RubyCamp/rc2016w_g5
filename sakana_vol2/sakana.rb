class Sakana < Sprite
  def initialize(x, y, image=nil)
#    @x, @y = x, y
#    @image = Image.load(image_file)
#    @image.set_color_key([0, 0, 0])
#    super(@x,@y,@image)
    self.x = x
    self.y = y
    image = Image.load(image) if image.is_a? String
    image.set_color_key([0, 0, 0])
    super
    @dy = 0
  end

  def set_random(d)
    @dy = (d / 10)+2
  end

  def update
#    @y += @dy
   self.y += @dy
  end
 # def reverse
  #  @dy = -@dy if obj.is_a?(Shimanekko)
 # end
  def shot(obj)
    vanish
    puts("hit!")
  end

#  def draw
#    Window.draw(@x, @y, @image)
#  end
end
