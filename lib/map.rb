require "gosu"

class Map
  attr_reader :width, :height

  def initialize(filename)
    @tileset = Gosu::Image.load_tiles("media/Floor.png", 48, 48, tileable: true)

    lines = File.readlines(filename).map { |line| line.chomp }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when '.'
          Tiles::Black
        when '#'
          Tiles::Earth
        when 'x'
          Tiles::Grass

        else
          nil
        end
      end
    end
  end
  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          @tileset[tile].draw(x * 48 , y * 48 , 0)
        end
      end
    end
  end
end
