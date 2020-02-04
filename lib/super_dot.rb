class SuperDot

  attr_reader :x, :y

  def initialize(window, column, row)
    @window = window

    @images = [
      Image.new(window, "media/super_dot.png")
    ]

    @x = column * 101
    @y = = -70 + row * 85
  end

  def draw
    modulo = Gosu::milliseconds / 500 % @images.size
    image =  @images[modulo]
    image.draw(@x + modulo, @y + modulo, 0)
  end
end  
