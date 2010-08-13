require File.join(File.dirname(__FILE__), "/test_helper")

class GridTest < DropXTest
  def test_drop_ball_in_grid
    @grid.insert(@ball, 0)
    assert_equal @ball, @grid.contents(0,0)
  end

  def test_uber_basic_collision
    @grid.insert(@ball, 0)
    @grid.insert(@ball_2 = Ball.new, 0)

    assert_equal @ball, @grid.contents(0, 0)
    assert_equal @ball_2, @grid.contents(0, 1)
  end

  def test_column_overflow
    7.times {|digit| @grid.insert(@ball, 0)}
    assert_raise ColumnOverflow do
      @grid.insert(@ball, 0)
    end
  end

  def test_column
    assert_equal @grid.column(0), [nil] * 7

    @ball.value = 7
    @grid.insert(@ball, 0)
    assert_equal @grid.column(0), [@ball] + [nil] * 6
  end

  def test_row
    assert_equal @grid.row(0), @grid[0]
  end

  def test_column_full
    assert ! @grid.column(0).full?
    7.times {@grid.insert(@ball, 0)}
    assert @grid.column(0).full?
  end

  def test_gravity_simplest_case
    7.times {|digit| @grid.insert(eval("@ball_#{digit} = Ball.new"), 0)}
    @grid[0][0] = nil
    assert_equal @grid.column(0), [nil] + [@ball_1, @ball_2, @ball_3, @ball_4, @ball_5, @ball_6]

    @grid.gravity!
    assert_equal @grid.column(0), [@ball_1, @ball_2, @ball_3, @ball_4, @ball_5, @ball_6] + [nil]
  end

  def test_gravity_multiple_nils
    7.times {|digit| @grid.insert(eval("@ball_#{digit} = Ball.new"), 0)}
    @grid[0][0] = @grid[2][0] = @grid[3][0] = @grid[5][0] = nil
    assert_equal @grid.column(0), [nil, @ball_1, nil, nil, @ball_4, nil, @ball_6]

    @grid.gravity!
    assert_equal @grid.column(0), [@ball_1, @ball_4, @ball_6] + [nil] * 4
  end

  def test_grid_to_s
    @grid.insert(@ball, 0)
    assert_equal @grid.to_s, "[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[?, nil, nil, nil, nil, nil, nil]\n"
  end

  def test_grid_cleared
    assert @grid.cleared?
    @grid.insert(@ball, 0)
    assert ! @grid.cleared?
  end
end
