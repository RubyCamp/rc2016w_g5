module Scene1
  class Director
    include SceneUtil

    def initialize
      @bg_img = Image.load("C:/rubycamp2016/most2/images/S1.png")
      set_timer(4)

    end

    def play
      Window.draw(0, 0, @bg_img)
      count_down(:scene2)
    end
  end
end
