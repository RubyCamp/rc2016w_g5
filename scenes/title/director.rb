module Title
  class Director
    include SceneUtil
    
    def initialize
      @bg_img = Image.load("C:/rubycamp2016/most2/images/bg.png")
      set_timer(4)
      @sound = Sound.new("C:/rubycamp2016/most2/music/flattery.wav")
      @soundflag = 0
    end

    def start
        if @soundflag == 0 then
	  @sound.play
          @soundflag = 1
        end
    end
    def play
      start
      Window.draw(0, 0, @bg_img)
      count_down(:scene1)
    end
  end
end
