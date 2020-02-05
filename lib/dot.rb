class Dot
  attr_reader :x, :y

  def initialize(window, column, row)
    @window = window
    @image = Image.new(@window, "media/dot.png", true)
    @width = @image.width
    @height = @image.height

    @x = column * 81
    @y = -130 + row * 105
  end

  def update
  end

  def draw
    @image.draw(@x, @y, 0)
  end
end
