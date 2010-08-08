# this is a minimal "game" for play-testing, discovering edge cases, etc.

require "lib/dropX.rb"
include DropX
@grid = Grid.new

def display_kaboom(kaboom)
  3.times do
    3.times {print "   #{kaboom}          "}
    puts
  end
  display_grid
end

def display_grid
  puts
  (0..6).to_a.reverse.each do |index|
    @grid[index].each do |ball|
      print "%8s" % ball.inspect
    end
    print "\n"
  end
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

  while(@grid.explode!{display_kaboom("ANSWER!!!")})
    display_kaboom("KABOOM!!!")
  end
end

