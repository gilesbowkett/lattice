require File.join(File.dirname(__FILE__), "/test_helper")

class HorizontalExplosionsTest < DropXTest
  def test_uber_basic_explosion_horizontal_7
    (0..5).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 7
    @grid.insert(@ball, 6)

    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, grey, grey, 7]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, grey, grey, nil]"
  end

  def test_uber_basic_explosion_horizontal_6
    (0..4).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 6
    @grid.insert(@ball, 5)

    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, grey, 6, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, grey, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_5
    (0..3).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 5
    @grid.insert(@ball, 4)

    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, 5, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_4
    (0..2).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 4
    @grid.insert(@ball, 3)

    assert_equal @grid[0].inspect, "[grey, grey, grey, 4, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, grey, grey, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_3
    [0,1].each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 3
    @grid.insert(@ball, 2)

    assert_equal @grid[0].inspect, "[grey, grey, 3, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, grey, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_2
    @grid.insert(Ball.new, 0)
    @ball.value = 2
    @grid.insert(@ball, 1)

    assert_equal @grid[0].inspect, "[grey, 2, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, nil, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_1
    @ball.value = 1
    @grid.insert(@ball, 0)

    assert_equal @grid[0].inspect, "[1, nil, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[nil, nil, nil, nil, nil, nil, nil]"
  end
end
