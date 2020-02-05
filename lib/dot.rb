class Dot
  attr_reader :x, :y

  def initialize(window, column, row)
    @window = window
    @image = Image.new(@window, "media/dot.png", true)
    @width = @image.width
    @height = @image.height

    @x = column * 101
    @y = -70 + row * 85
  end

  def update
  end

  def draw
    @image.draw(@x, @y, 0)
  end
end
