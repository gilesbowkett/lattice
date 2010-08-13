%w{array
   column_overflow
   ball
   grid
   console_game
   score}.each do |lib|
     require File.join(File.dirname(__FILE__), "/", lib)
   end
