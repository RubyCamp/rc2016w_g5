require 'dxruby'										#読み込み
require 'smalrubot'
require_relative 'sakana'
require_relative 'shimanekko'
require_relative 'akikan'
class Director
  def initialize
    @sakanas = []										#
    @akikans = []
    shimanekko = Shimanekko.new(350,500,"images/neko.png")
    @shimanekko = shimanekko
    @board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
    @bg_img = Image.load("images/background.png")
    @prev_button = 0
		@@f = 0
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
    	if rand(10) <= 6
    		sakana = Sakana.new(rand(700), 0, "images/donchicchi2.png")
      	sakana.set_random(rand(50))	
      	@sakanas << sakana
      else
  	   	akikan = Akikan.new(rand(700), 0 , "images/akikan.png")
      	akikan.set_random(rand(50))
      	@akikans << akikan
      end
  	
  		
  	end
  	@sakanas.reject!{|sakana| sakana.vanished? }
  	@akikans.reject!{|akikan| akikan.vanished? }
  	Sprite.update(@sakanas)
  	Sprite.update(@shimanekko)
  	Sprite.update(@akikans)
    Sprite.check(@sakanas, @shimanekko)
    Sprite.check(@akikans, @shimanekko,shot=:shot,hit=:reverse)
   	Sprite.draw(@sakanas)
    Sprite.draw(@shimanekko)
    Sprite.draw(@akikans)
  	@prev_button = @button
  end
end
