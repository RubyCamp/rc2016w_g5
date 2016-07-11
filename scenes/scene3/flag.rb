class Flag < Sprite
  def initialize(x, y, image = nil)
    image = Image.load("images/flag.png")
    image.set_color_key([0, 0, 0])
    super
    self.z = 7 # ninjin、ballの次に前面に表示
  end

  def hit(obj)
    puts "Gooooool"
    exit
  end
end
