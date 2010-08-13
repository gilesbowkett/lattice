module DropX
  class Grid
    def initialize
      @grid = []
      7.times {@grid << Array.new(7)}
      @tagged_to_explode = []
    end

    def [](index)
      @grid[index]
    end
    alias :row :[]

    def to_s
      @grid.reverse.inject("") do |string, row|
        string << "#{row.inspect}\n"
      end
    end

    def insert(ball, column)
      @grid.each do |row|
        next unless row[column].nil?
        row[column] = ball
        return
      end
      raise ColumnOverflow
    end

    def contents(x, y)
      @grid[y][x]
    end

    def column(index)
      @grid.collect do |row|
        row[index]
      end
    end

    def cleared?
      @grid.flatten.compact.empty?
    end

    def explode!(&block)
      explode_horizontal
      explode_vertical
      blowback(&block)
      kaboom
      gravity!

      if @tagged_to_explode.empty?
        return false
      else
        @tagged_to_explode = []
        return true
      end
    end

    def check_explosion(ball, array, row_number, column_number)
      if ball.is_a?(Ball) && array.sequence?(ball)
        @tagged_to_explode << [row_number, column_number]
      end
    end

    def explode_horizontal
      @grid.each_with_index do |row, row_number|
        row.each_with_index do |ball, column_number|
          check_explosion(ball, row, row_number, column_number)
        end
      end
    end

    def explode_vertical
      (0..6).each do |column_number|
        column(column_number).each_with_index do |ball, row_number|
          check_explosion(ball, column(column_number), row_number, column_number)
        end
      end
    end

    def kaboom
      @tagged_to_explode.each do |row, column|
        @grid[row][column] = nil
      end
    end

    def blowback(&block)
      # collect all the coordinates for explosions, and then communicate
      # the blowback to the balls one unit away. ? balls don't change
      # on explosion; they change on proximity to it.
      # refactor later to collect, maybe
      @blowback = []
      @tagged_to_explode.each do |row, column|
        @blowback << @grid[row - 1][column] unless 0 == row
        @blowback << @grid[row + 1][column] unless 6 == row
        @blowback << @grid[row][column - 1] unless 0 == column
        @blowback << @grid[row][column + 1] unless 6 == column
      end
      shatter = (! @blowback.compact.empty?) && @blowback.inspect =~ /\?/
      @blowback.compact.uniq.each {|ball| ball.advance_state!}
      block.call if block_given? and shatter
    end

    def clear_column(column_number)
      (0..6).each do |row_number|
        @grid[row_number][column_number] = nil
      end
    end

    def gravity!
      (0..6).each do |column_number|
        balls = column(column_number).drop
        clear_column(column_number)
        balls.each do |ball|
          insert(ball, column_number)
        end
      end
    end
  end
end
