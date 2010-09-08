%w{array
   exceptions
   ball
   grid
   console_game
   score}.each do |lib|
     require File.join(File.dirname(__FILE__), "/", lib)
   end
