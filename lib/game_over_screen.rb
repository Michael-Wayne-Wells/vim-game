class GameOverScreen

  def initialize(window)
    @window = window
    @sad_pac_image = Gosu::Image.new("media/sad-pac.png", :tileable => false)

    @title = Image.from_text(
      @window,
      "GAME OVER !!!",
      Gosu::default_font_name,
      150,
      10,
      WIDTH,
      :center
    )
  end

  def draw
    @title.draw(0,(HEIGHT - 300) / 2,0)
    @sad_pac_image.draw(470,450,0)
  end

  def update ; end

  def button_down(id)
    @window.show_main_menu
  end

end
