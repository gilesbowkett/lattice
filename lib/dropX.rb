%w{array
   column_overflow
   ball
   grid
   console_game}.each do |lib|
     require File.join(File.dirname(__FILE__), "/", lib)
   end
