class Shimaneko < Sprite
  attr_accessor :distance
	attr_accessor :button
	attr_accessor :button1
  attr_accessor :dx
	attr_reader :fish
	attr_reader :score 

  def initialize(x, y, image = nil)
    image = Image.load("C:/rubycamp2016/most2/images/neko.png")
    image.set_color_key([0, 0, 0])
    @image = image
	@sound = Sound.new("C:/rubycamp2016/most2/music/paku.wav")
	@sound2 = Sound.new("C:/rubycamp2016/most2/music/se_maoudamashii_chime14.wav")
    super
    self.z = 9  #最前面に表示
    self.y = 300
    self.x = 300
    
		@fish = 0
    @direction = 1
    @dx=0
    @dy = 1
    @current_floor = 1
    @distance = 255
		@button = 0
		@button1 = 0
		@character_height = 69
		@score = 0

  end

  def update
    @reached_wall = false
    alpha = @distance > 400 ? -5 : 5
    dy = alpha
    if 200>y or 680<y
      reverse
    end
#----------- contrl x -----------
    x = self.x + @dx
    if x < 0
      x = 0
    elsif x > Window.width - @image.width
      x = Window.width - @image.width
    end
    self.x = x

	#	self.x += @dx

#------------ contrl y ------------
    y = self.y + dy
    if y < 200
      y = 200
    elsif y > Window.height - @image.height
      y = Window.height - @image.height
    end
    self.y = y
#------------------------------------
    @dx = 0
		@dy = 0
  end

  def reverse
    @direction *= -1
  end

  def on_floor(floor)
    if floor.no > @current_floor
      # 逆走できることを考慮し、次のfloorへ進む側の壁に当たった時だけ更新する
      if @reached_wall
        @current_floor = floor.no
      else
        return
      end
    end
    self.y -= 2
  end

  def hit(obj)
    @score += 1
    @sound.play
  end 

  def reverse(obj)
    @score -=5
    @sound2.play
  end

=begin
  def hit(ball)
    if @distance > 50
      self.x = 0
      self.y = 430
      @current_floor = 1
      @fish += 1
      if @fish == 0
        puts "game over!!!!!!!!!"
        exit
      end
    end
  end
=end
end
