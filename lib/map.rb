require 'gosu'
class Map

  def initialize(window)
    @window = window
    @tiles = [] #setup_tiles(window, rows, columns)

    @tile_specs   = {
      "S" => {:image => Image.new("media/stone_block.png", :tileable => true)  , :walkable => false },
      "#" => {:image => Image.new("media/stone_block.png", :tileable => true)  , :walkable => true  },
      "B" => {:image => Image.new("media/block.png", :tileable => true)  , :walkable => false }
    }
  end

  def draw
    @tiles.each{|t| t.draw }
  end

  def add_tile(row, column, type)
    tile_spec = if @tile_specs.keys.include?(type)
      @tile_specs[type]
    else
      @tile_specs["#"]
    end
    @tiles << Tile.new(@window, row, column, tile_spec[:image], tile_spec[:walkable])
  end

  def walkable?(hit_box)
    blocked = @tiles.any? do |tile|
      tile.blocked?(hit_box)
    end
    !blocked
  end

end
