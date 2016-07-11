require 'smalrubot'
require_relative 'shimaneko'
require_relative 'flag'
require_relative 'akikan'
require_relative 'sakana'

module Scene3

  class Director

    def initialize
	@background = Image.load("C:/rubycamp2016/most2/images/S3.jpg")
	@sound = Sound.new("C:/rubycamp2016/most2/music/cat.wav")
	@soundflag = 0
      @board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
			@sakanas = []
      @akikans = []
      @font = Font.new(32)
      @prev_button = 0
      @prev_button1 = 0
      @prev_fish = 0
      @shimaneko = ::Shimaneko.new(0, 430)
      @flag = Flag.new(40, 85)
     # sound = Sound.new("C:/rubycamp2016/most2/music/se_maoudamashii_chime14.wav")
      @start_time = Time.now


		@time = 20
			@color=[255,255,255] 
    end

    def update
      @shimaneko.update
		Sprite.update(@sakanas)
  		Sprite.update(@shimaneko)
  		Sprite.update(@akikans)
    end

		def disapear
			 	@sakanas.reject!{|sakana| sakana.vanished? }
  			@akikans.reject!{|akikan| akikan.vanished? }
		end

    def check_time
      if @time <= 0 then
	puts 10
         @sound.stop
      end
      if @time <= 0 && @shimaneko.score >= 40
				Scene.set_current_scene(:end1)	
        puts "end1"
			elsif @time <= 0 && @shimaneko.score < 40
				Scene.set_current_scene(:end2)
        puts "end2"
      end
    end

    def check
      # Sprite.checkメソッドでは、衝突判定時に実行するメソッド名をシンボルで渡すことが可能
      # メソッド名を指定しない場合、第一引数のオブジェクトはshotメソッド、第二引数のオブジェクトはhitメソッドが呼ばれる
      # 第三引数にはshotメソッドの代わりに実行するメソッド、第四引数にはhitメソッドの代わりに実行するメソッドを指定する
     # Sprite.check(@shimaneko, @flag)
     Sprite.check(@sakanas, @shimaneko)
     Sprite.check(@akikans, @shimaneko,shot=:shot,hit=:reverse)
    end

    def draw
      @shimaneko.draw
      @flag.draw
      Window.draw_font(400, 20, "Fish: #{ @shimaneko.score}", @font, {color: [0,0,0]})
      Window.draw_font(500, 20, "Time: #{@time = 50 - (Time.now - @start_time).to_i}", @font, {color: [0,0,0]})
		 	Sprite.draw(@sakanas)
   	  Sprite.draw(@shimaneko)
   	  Sprite.draw(@akikans)
    end

    def get_sensors
      @distance = @board.analog_read(4) #　距離の値取得
      @button1 = @board.digital_read(2)    # ボタンの値取得
      @button = @board.digital_read(3)    # ボタンの値取得
      @m_fish = @board.digital_read(6)      # 傾きセンサーの値取得
    end

    # 連続で値を拾わないように、直前の値を記憶しておく
    def button_pressed?
      @button == 1 && @prev_button == 0
    end

    def button_pressed1?
      @button1 == 1 && @prev_button1 == 0
    end
    def start
        if @soundflag == 0 then
	  @sound.play
          @soundflag = 1
        end
    end
    # 同上
    def call_fish?
      @m_fish == 1 && @prev_fish == 0
    end
    


    def play

	Window.draw(0, 0, @background)
      get_sensors
	start
#--------- create fish & cand ----------
	if call_fish?
    		if rand(10) <= 7
    			sakana = Sakana.new(rand(700), 0, "C:/rubycamp2016/most2/images/donchicchi2.png")
      		sakana.set_random(rand(50))	
      		@sakanas << sakana
      	else
  	   		akikan = Akikan.new(rand(700), 0 , "C:/rubycamp2016/most2/images/akikan.png")
      		akikan.set_random(rand(50))
      		@akikans << akikan
				end
    	end

#------------- y ---------- 
      @shimaneko.distance = @distance 
#--------- x ----------
      if button_pressed?
        @shimaneko.dx=10
      end
      if button_pressed1?
        @shimaneko.dx=-10
      end
#------------------
      update
      check
      disapear
      check_time
      draw
     @prev_fish = @m_fish
    end
  end
end