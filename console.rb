# this is a minimal "game" for play-testing, discovering edge cases, etc.

require "lib/dropX.rb"
include DropX
@grid = Grid.new

def display_grid
  puts
  puts @grid.to_s
  puts
end

while true
  display_grid

  # ball choose/drop UI
  puts "new number: #{number = rand(7) + 1}" # zero-indexed
  print "column number to drop into? "

  # droppity drop drop drop
  column = gets.chomp.to_i - 1
  @grid.insert(Ball.new(number), column)
  display_grid

  # to be implemented
  while(@grid.explode!)
    3.times {puts "              KABOOM!!!"}
    display_grid
  end
end

