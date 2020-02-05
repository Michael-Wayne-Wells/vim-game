class Player

  WALKING_SPEED = 5

  attr_reader :x, :y

  def initialize(window, level, column, row)
    @window = window
    @level = level
    # @image = Image.new(@window, "media/player.png", true)
    @chomp1, @chomp2, @chomp3 = Gosu::Image.load_tiles("media/player.png", 79, 80, :tileable => false)
    @image = @chomp2
    @width = @image.width
    @height = @image.height
    @offset_x = 55
    @offset_y = 75
    @x = column * @image.width
    @y = row * @offset_y
    @direction = :right
  end

  def hit_box(x, y)
    {:x => x, :y => y, :width => @width, :height => 80}
  end

  def update
  end

  def draw
    if @direction == :left
      @image.draw(@x, @y, 0, -1.0, 1.0)
    else
      @image.draw(@x, @y, 0)
    end
  end

  def move_left
    move(-1 * WALKING_SPEED, 0)
    @image = (milliseconds / 175 % 2 == 0) ? @chomp1 : @chomp3
    @direction = :left
  end

  def move_right
    move(WALKING_SPEED, 0)
    @image = (milliseconds / 175 % 2 == 0) ? @chomp1 : @chomp3
    @direction = :right
  end

  def move_up
    move(0, -1 * WALKING_SPEED)
    @image = (milliseconds / 175 % 2 == 0) ? @chomp1 : @chomp3
    @direction = :up
  end

  def move_down
    move(0, WALKING_SPEED)
    @image = (milliseconds / 175 % 2 == 0) ? @chomp1 : @chomp3
    @direction = :down
  end

  def move(x, y)
    new_x = @x + x
    new_y = @y + y
    if  @level.map.walkable?(hit_box(new_x, new_y))
      @x = new_x
      @y = new_y
    end
  end

  def collect_dots(dots)
    dots.reject! do |dot|
      Gosu::distance(@x + 50, @y + 20, dot.x, dot.y) < 35
    end
  end

  def cherry_collected?
    @cherry_collected
  end

  def collect_cherry(cherry)
    if Gosu::distance(@x, @y, cherry.x, cherry.y) < 35
      puts 'cherry collected'
      @cherry_collected = true
      true
    else
      false
    end
  end

  # def fits?(x, y)
  #   fits_horizontally?(x) && fits_vertically?(y)
  # end
  #
  # def fits_horizontally?(x)
  #   x > -10 && x + @width < @window.width
  # end
  #
  # def fits_vertically?(y)
  #   y > 0 - @offset_y && y + @height - @offset_x < @window.height
  # end
end
