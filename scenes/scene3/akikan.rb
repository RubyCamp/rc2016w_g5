class Akikan < Sprite
  def initialize(x, y, image=nil)

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

   self.y += @dy
  end

  def shot(obj)
    vanish
  end


end
