require File.join(File.dirname(__FILE__), "/test_helper")

class VerticalExplosionsTest < DropXTest
  def test_uber_basic_explosion_vertical_7
    6.times {@grid.insert(Ball.new, 0)}
    @ball.value = 7
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[?, ?, ?, ?, ?, ?, 7]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[?, ?, ?, ?, ?, ??, nil]"
  end

  def test_uber_basic_explosion_vertical_6
    5.times {@grid.insert(Ball.new, 0)}
    @ball.value = 6
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[?, ?, ?, ?, ?, 6, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[?, ?, ?, ?, ??, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_5
    4.times {@grid.insert(Ball.new, 0)}
    @ball.value = 5
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[?, ?, ?, ?, 5, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[?, ?, ?, ??, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_4
    3.times {@grid.insert(Ball.new, 0)}
    @ball.value = 4
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[?, ?, ?, 4, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[?, ?, ??, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_3
    2.times {@grid.insert(Ball.new, 0)}
    @ball.value = 3
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[?, ?, 3, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[?, ??, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_2
    @grid.insert(Ball.new, 0)
    @ball.value = 2
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[?, 2, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[??, nil, nil, nil, nil, nil, nil]"
  end

  def test_uber_basic_explosion_vertical_1
    @ball.value = 1
    @grid.insert(@ball, 0)

    assert_equal @grid.column(0).inspect, "[1, nil, nil, nil, nil, nil, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[nil, nil, nil, nil, nil, nil, nil]"
  end

  def test_question_balls
    question_second_phase = Ball.new.advance_state!
    [Ball.new(6),
     question_second_phase,
     Ball.new.advance_state!,
     Ball.new(3),
     Ball.new(2),
     Ball.new].each do |ball|
      @grid.insert(ball, 0)
    end
    # test/examples/column.html
    assert_equal @grid.column(0).inspect, "[6, ??, ??, 3, 2, ?, nil]"
    @grid.explode!
    assert_equal @grid.column(0).inspect, "[#{question_second_phase.value}, ??, 3, 2, ?, nil, nil]"
  end
end
