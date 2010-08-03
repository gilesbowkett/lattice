# this is a minimal "game" for play-testing, discovering edge cases, etc.

require "lib/dropX.rb"
include DropX
@grid = Grid.new

def display_grid
  puts
  puts @grid.to_s
  puts
end

display_grid

while true
  # ball choose/drop UI
  next_ball = Ball.next
  puts "new number: #{next_ball.value}" # zero-indexed
  print "column number to drop into? "

  # droppity drop drop drop
  column = gets.chomp.to_i - 1
  @grid.insert(next_ball, column)
  display_grid

  while(@grid.explode!)
    3.times {puts "              KABOOM!!!"}
    display_grid
  end
end

