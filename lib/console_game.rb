class ConsoleGame
  # this is a minimal "game" for play-testing, discovering edge cases, etc.
  def initialize
    @grid = Grid.new
    @score = Score.new
  end

  def go
    display_grid
    play_game
  end

  def display_kaboom(kaboom)
    3.times do
      3.times {print "   #{kaboom}          "}
      puts
    end
    if @grid.cleared?
      puts "   CLEARED THAT MOTHERFUCKER!!!! 70,000 POINT BONUS!!!!!"
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

  def play_game
    while true
      # ball choose/drop UI
      next_ball = Ball.next
      if 1 < @score.chain
        puts "chain! #{@score.chain}"
      end
      @score.chain = 0
      puts "new number: #{next_ball.value}" # zero-indexed
      print "column number to drop into? "

      # droppity drop drop drop
      column = gets.chomp.to_i - 1
      @grid.insert(next_ball, column)
      display_grid

      while(@grid.explode!{display_kaboom("ANSWER!!!")})
        display_kaboom("KABOOM!!!")
        @score.chain += 1
      end
    end
  end
end

