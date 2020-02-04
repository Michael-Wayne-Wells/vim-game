require "gosu"

class Map
  attr_reader :width, :height, :gems

  def initialize(filename)
    @tileset = Gosu::Image.load_tiles("media/Floor.png", 48, 48, tileable: true)
    gem_img = Gosu::Image.new("media/gem.png")
    @gems = []

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
    # Very primitive drawing function:
    # Draws all the tiles, some off-screen, some on-screen.
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          # Draw the tile with an offset (tile images have some overlap)
          # Scrolling is implemented here just as in the game objects.
          @tileset[tile].draw(x * 48 , y * 48 , 0)
        end
      end
    end
    @gems.each { |c| c.draw }
  end

  # Solid at a given pixel position?
  def solid?(x, y)
    y < 0 || @tiles[x / 20][y / 20]
  end
end
