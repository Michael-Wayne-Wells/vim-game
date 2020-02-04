require 'gosu'

$LOAD_PATH << './lib'
Dir.glob("lib/*.rb").each do |file|
  require File.basename(file, "*.rb")
end

VimGame.new.show if __FILE__ == $0
