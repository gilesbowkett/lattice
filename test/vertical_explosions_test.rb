require File.join(File.dirname(__FILE__), "/test_helper")

class VerticalExplosionsTest < DropXTest
  def test_uber_basic_explosion_vertical_7
    6.times {@grid.insert(Ball.new, 0)}
    @ball.value = 7
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[grey, grey, grey, grey, grey, grey, 7]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[grey, grey, grey, grey, grey, grey2, nil]"
  end

  def test_uber_basic_explosion_vertical_6
    5.times {@grid.insert(Ball.new, 0)}
    @ball.value = 6
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[grey, grey, grey, grey, grey, 6, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[grey, grey, grey, grey, grey2, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_5
    4.times {@grid.insert(Ball.new, 0)}
    @ball.value = 5
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[grey, grey, grey, grey, 5, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[grey, grey, grey, grey2, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_4
    3.times {@grid.insert(Ball.new, 0)}
    @ball.value = 4
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[grey, grey, grey, 4, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[grey, grey, grey2, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_3
    2.times {@grid.insert(Ball.new, 0)}
    @ball.value = 3
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[grey, grey, 3, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[grey, grey2, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_2
    @grid.insert(Ball.new, 0)
    @ball.value = 2
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[grey, 2, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[grey2, nil, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_1
    @ball.value = 1
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[1, nil, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[nil, nil, nil, nil, nil, nil, nil]"
  end

  def test_actual_fuckup_that_happened
    [Ball.new(6),
     Ball.new.advance_state!,
     Ball.new.advance_state!,
     Ball.new(3),
     Ball.new(2),
     Ball.new].each do |ball|
      @grid.insert(ball, 0)
    end
    # test/examples/column.html
    assert_equal @grid.column(0).inspect, "[6, grey2, grey2, 3, 2, grey, nil]"
  end
end
