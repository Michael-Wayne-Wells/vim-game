require "gosu"

$LOAD_PATH << './lib'
Dir.glob("lib/*.rb").each do |file|
  require File.basename(file, "*.rb")
end

include Gosu

WIDTH, HEIGHT = 1240, 800

module Tiles
  Black = 1
  Grass = 14
  Earth = 7
end

class VimGame < (Example rescue Gosu::Window)

  attr_accessor :controller

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "PacVim"
    @menu_controller = Menu.new(self)
    # @sky = Gosu::Image.new("media/space.png", tileable: true)
    @map = Map.new("media/levelone.txt")
    @controller = @menu_controller
    show_main_menu
  end

  def show_main_menu
    @levels = read_levels
    @controller = @menu_controller
  end

  def show_next_level
    next_level = @levels.pop
    if next_level
      @controller = Level.new(self, next_level)
    else
      show_main_menu
    end
  end

  def show_game_over_screen
    @controller = @game_over_screen
  end

  def show_level_finished_screen
    @controller = @level_finished_screen
  end

  def update
    @controller.update
  end

  def draw
    @controller.draw
    # @map.draw
  end

  def button_down(id)
    @controller.button_down(id)
  end

  protected

  def read_levels
    Dir.glob("media/levelone.txt").map do |path|
      {
        :path  => path,
        :level => File.basename(path, ".txt").to_i
      }
    end.reverse
  end

end
