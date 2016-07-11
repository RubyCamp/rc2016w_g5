require 'dxruby'
require 'smalrubot'
require_relative 'sakana'
require_relative 'shimanekko'
class Director
  def initialize
    @sakanas = []
 #   @shimanekko = []
    shimanekko = Shimanekko.new(350,500,"images/neko.png")
    @shimanekko = shimanekko
    @board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
    @bg_img = Image.load("images/background.png")
    @prev_button = 0
  end
  
  def get_sensors
    @button=@board.digital_read(2)
	end
  def button_pressed?
    @button==1 && @prev_button == 0
  end

  def play
    get_sensors
    
    if button_pressed?
    	sakana = Sakana.new(rand(700), 0, "images/donchicchi2.png")
      sakana.set_random(rand(50))
  		@sakanas << sakana
  	end
  	@sakanas.reject!{|sakana| sakana.vanished? }
  	Sprite.update(@sakanas)
  	Sprite.update(@shimanekko)
    Sprite.check(@sakanas, @shimanekko)
   	Sprite.draw(@sakanas)
    Sprite.draw(@shimanekko)
  	@prev_button = @button
  end
end
