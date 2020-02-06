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
    @offset_x = 40
    @offset_y = 80
    @x = column * @image.width
    @y = row * @offset_y
    @direction = :right
    @bleep = Gosu::Sample.new("media/bloop.wav")
    @success = Gosu::Sample.new("media/success-sound-effect.mp3")
    @angle = 0
  end

  def hit_box(x, y)
    {:x => x - 50, :y => y - 40, :width => 80, :height => 80}
  end

  def update
  end

  def draw
    if @direction == :left
      @image.draw(@x + 40, @y - 50, 0, -1.0, 1.0)
    elsif @direction == :up
      @image.draw_rot(@x - 20, @y, 1, 270)
    elsif @direction == :down
      @image.draw_rot(@x - 20, @y, 1, 90)
    elsif @direction == :right
      @image.draw(@x - 40, @y - 50, 0)
    else
      @image.draw(@x - 20, @y, 0)
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
    if fits?(new_x, new_y) && @level.map.walkable?(hit_box(new_x, new_y))
      @x = new_x
      @y = new_y
    end
  end

  def collect_dots(dots)

    if @window.button_down? KbI

      dots.reject! do |dot|
        @bleep.play(volume = 0.03, speed = 1, looping = false)
        Gosu::distance(@x, @y, dot.x, dot.y) < 35
      end
    end
  end

  def cherry_collected?
    @cherry_collected
  end

  def collect_cherry(cherry)
    if @window.button_down? KbI
      if Gosu::distance(@x - 30, @y, cherry.x, cherry.y) < 80
        puts 'cherry collected'
        @success.play
        @cherry_collected = true
        true
      else
        false
      end
    end
  end


  def fits?(x, y)
    fits_horizontally?(x) && fits_vertically?(y)
  end

  def fits_horizontally?(x)
    x > -10 && x + @width < @window.width
  end

  def fits_vertically?(y)
    y > 0 - @offset_y && y + @height - @offset_x < @window.height
  end


  # def goose_honked?
  #   @goose_honked
  # end
  #
  # def goose_honk(goose)
  #   if Gosu::distance(@x, @y, goose.x, goose.y) < 35
  #     puts 'goose honks'
  #     @goose_honked = true
  #     @honk.play
  #     true
  #   else
  #     false
  #   end
  # end
end
