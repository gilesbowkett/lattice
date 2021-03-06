require File.join(File.dirname(__FILE__), "/test_helper")

class HorizontalExplosionsTest < DropXTest
  def test_uber_basic_explosion_horizontal_7
    (0..5).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 7
    @grid.insert(@ball, 6)

    assert_equal @grid[0].inspect, "[?, ?, ?, ?, ?, ?, 7]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[?, ?, ?, ?, ?, ??, nil]"
  end

  def test_uber_basic_explosion_horizontal_6
    (0..4).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 6
    @grid.insert(@ball, 5)

    assert_equal @grid[0].inspect, "[?, ?, ?, ?, ?, 6, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[?, ?, ?, ?, ??, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_5
    (0..3).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 5
    @grid.insert(@ball, 4)

    assert_equal @grid[0].inspect, "[?, ?, ?, ?, 5, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[?, ?, ?, ??, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_4
    (0..2).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 4
    @grid.insert(@ball, 3)

    assert_equal @grid[0].inspect, "[?, ?, ?, 4, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[?, ?, ??, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_3
    [0,1].each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 3
    @grid.insert(@ball, 2)

    assert_equal @grid[0].inspect, "[?, ?, 3, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[?, ??, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_2
    @grid.insert(Ball.new, 0)
    @ball.value = 2
    @grid.insert(@ball, 1)

    assert_equal @grid[0].inspect, "[?, 2, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[??, nil, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_horizontal_1
    @ball.value = 1
    @grid.insert(@ball, 0)

    assert_equal @grid[0].inspect, "[1, nil, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[nil, nil, nil, nil, nil, nil, nil]"
  end
end
