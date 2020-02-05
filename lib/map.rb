require 'gosu'
class Map

  def initialize(window)
    @window = window
    @tiles = [] #setup_tiles(window, rows, columns)
    @water_image = Gosu::Image.new("media/water.png", :tileable => true)
    @grass_image = Image.new("media/grass_block.png", :tileable => true)
    @tile_specs   = {
      "W" => {:image => Image.new("media/block.png", :tileable => true)  , :walkable => false },
      "#" => {:image => Image.new("media/grass_block.png", :tileable => true)  , :walkable => true  },
      "S" => {:image => Image.new("media/stone_block.png", :tileable => true)  , :walkable => true  },
      "D" => {:image => Image.new("media/dirt_block.png", :tileable => true)  , :walkable => true  }
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
