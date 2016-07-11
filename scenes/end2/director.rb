module End2
  class Director
    include SceneUtil

    def initialize
      @bg_img = Image.load("C:/rubycamp2016/most2/images/M.png")
      set_timer(3)
	@sound = Sound.new("C:/rubycamp2016/most2/music/Failure.wav")
	@soundflag = 1
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
    end
  end
end
