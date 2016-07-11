class Sakana < Sprite
  def initialize(x, y, image=nil)
    self.x = x
    self.y = y
		@rad = rand((-Math::PI)..(Math::PI))
    image = Image.load(image) if image.is_a? String
    image.set_color_key([0, 0, 0])
    #sound = Sound.new("C:/rubycamp2016/most2/music/se_maoudamashii_chime14.wav")
    super
    @dy = 0
  end

  def set_random(d)
    @dy = (d / 10)+2
  end

  def update
   self.y += @dy
	 dd = 0.1
	 @rad -= dd
	 self.x += 5*Math.sin(@rad)
  end
  def shot(obj)
    #sound.play
    vanish
  end
end
