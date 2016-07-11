module Scene2
  class Director
    include SceneUtil

    def initialize
      @bg_img = Image.load("C:/rubycamp2016/most2/images/S2.png")
      set_timer(3)
    end

    def play
      Window.draw(0, 0, @bg_img)
      count_down(:scene3)
    end
  end
end
