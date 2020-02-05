class Menu
  def initialize(window)
    @window = window
    @menu_image = Gosu::Image.new(window, "media/menu-screen.jpg", false, :center)

    @title = Image.from_text(
      @window,
      "Pacman VIM",
      Gosu::default_font_name,
      50,
      10,
      WIDTH,
      :center
    )
  end

  def draw
    @title.draw(0,(HEIGHT - 300) / 2,0)
    @menu_image.draw(130,400,0)
  end

  def update ; end

  def button_down(id)
    if id == Gosu::KbEscape || id == Gosu::KbQ
      @window.close
    elsif id == Gosu::KbSpace
      @window.show_next_level
    end
  end
end
