class Player

  WALKING_SPEED = 5

  attr_reader :x, :y

  def initialize(window, level, column, row)
    @window = window
    @level = level
    @image = Image.new(@window, "media/player.png", true)
    @width = @image.width
    @height = @image.height
    @offset_x = 40
    @offset_y = 70
    @x = column * @image.width
    @y = row * @offset_y
  end

  def hit_box(x, y)
    {:x => x, :y => y + 86, :width => @width, :height => 100}
  end

  def update
  end

  def draw
    @image.draw(@x, @y, 0)
  end

  def move_left
    move(-1 * WALKING_SPEED, 0)
  end

  def move_right
    move(WALKING_SPEED, 0)
  end

  def move_up
    move(0, -1 * WALKING_SPEED)
  end

  def move_down
    move(0, WALKING_SPEED)
  end

  def move(x, y)
    new_x = @x + x
    new_y = @y + y
    if @level.map.walkable?(hit_box(new_x, new_y))
      @x = new_x
      @y = new_y
    end
  end
end
# need @player_points
#need bonus method
#need dots_collected? method
#need super_dot method
#need eat_ghosts method
