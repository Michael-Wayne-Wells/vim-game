class Level

  attr_reader :map

  ROWS = 11
  COLUMNS = 15

  def initialize(window, level)
    @level                  = level
    @window                 = window
    @window.caption         = "Pacman Vim"
    # @background_music       = Song.new("media/8-punk-8-bit-music.mp3")
    @honk                   = Gosu::Sample.new("media/honk-sound.mp3")
    @map                    = Map.new(@window)
    @player, @dots, @ghosts, @cherry, @gooses, @yoshis = read_level(level, ROWS, COLUMNS)
    # @background_music.play(true) unless ENV['DISABLE_SOUND'] == 'true'
    # @honk.play(true)
  end

  def update
    @player.move_left   if @window.button_down? KbH
    @player.move_right  if @window.button_down? KbL
    @player.move_up     if @window.button_down? KbK
    @player.move_down   if @window.button_down? KbJ
    @player.collect_dots(@dots)
    @player.collect_cherry(@cherry) unless @player.cherry_collected?
    # @player.goose_honk(@goose)
    if hit_by_ghost?
      game_over
    elsif hit_by_goose?
      game_over
    elsif @dots.size == 0
      level_finished
    end
    @ghosts.each{ |ghost| ghost.update }
    @gooses.each{ |goose| goose.update }
    @yoshis.each{ |yoshi| yoshi.update }
  end

  def draw
    @map.draw
    (@dots + @ghosts + @gooses + @yoshis).each do |e|
      e.draw
    end
    @cherry.draw unless @player.cherry_collected?
    @player.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape || id == Gosu::KbQ then
      @window.show_main_menu
    end
  end

  def hit_by_ghost?
    player_box = @player.hit_box(@player.x, @player.y)
    @ghosts.any? do |ghost|
      ghost_box = ghost.hit_box(ghost.x, ghost.y)
      if player_box[:x] + player_box[:width] >= ghost_box[:x] &&
        player_box[:x] <= ghost_box[:x] + ghost_box[:width] &&
        player_box[:y] + player_box[:height] >= ghost_box[:y] &&
        player_box[:y] <= ghost_box[:y] + ghost_box[:height]
        true
      else
        false
      end
    end
  end

  def hit_by_yoshi?
    player_box = @player.hit_box(@player.x, @player.y)
    @yoshis.any? do |yoshi|
      yoshi_box = yoshi.hit_box(yoshi.x, yoshi.y)
      if player_box[:x] + player_box[:width] >= yoshi_box[:x] &&
        player_box[:x] <= yoshi_box[:x] + yoshi_box[:width] &&
        player_box[:y] + player_box[:height] >= yoshi_box[:y] &&
        player_box[:y] <= yoshi_box[:y] + yoshi_box[:height]
        true
      else
        false
      end
    end
  end

def hit_by_goose?
  player_box = @player.hit_box(@player.x, @player.y)

  @gooses.any? do |goose|
    goose_box = goose.hit_box(goose.x, goose.y)
    if player_box[:x] + player_box[:width] >= goose_box[:x] &&
      player_box[:x] <= goose_box[:x] + goose_box[:width] &&
      player_box[:y] + player_box[:height] >= goose_box[:y] &&
      player_box[:y] <= goose_box[:y] + goose_box[:height]
      @honk.play
      true
    else
      false
    end
  end
end
  def level_finished
    puts 'finished level'
    @window.show_level_finished_screen
  end

  def game_over
    puts 'game over'
    @window.show_game_over_screen
  end

  def read_level(level, rows, columns)
    player = nil
    dots   = []
    ghosts   = []
    gooses = []
    yoshis = []
    cherry    = nil
    level  = File.open(level[:path]).readlines[1..-1]

    rows.times do |row|
    columns.times do |column|
      tile_type = level[row][column]
      case tile_type
      when 'P'
        player = Player.new(@window, self, column, row)
      when 'D'
        dots << Dot.new(@window, column, row)
      when 'M'
        gooses << Goose.new(@window, self, column, row)
      when 'G'
        ghosts << Ghost.new(@window, self, column, row)
      when 'C'
        cherry = Cherry.new(@window, column, row)
      when 'Y'
        yoshis << Yoshi.new(@window, self, column, row)
      else
      end
      @map.add_tile(row, column, tile_type)
    end
  end



    [player, dots, ghosts, cherry, gooses, yoshis]
  end
  end
