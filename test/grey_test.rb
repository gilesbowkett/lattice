require File.join(File.dirname(__FILE__), "/test_helper")

class QuestionBallsTest < DropXTest
  def test_advance_state
    # simplest state machine ever
    assert_equal :"?", @ball.value
    @ball.advance_state!
    assert_equal :"??", @ball.value
    @ball.advance_state!
    assert @ball.value.is_a?(Fixnum)
  end

  # test/examples/blowback.html
  def test_blowback
    @grid.insert(Ball.new(:"?"), 0)
    2.times {@grid.insert(Ball.new(6), 1)}
    @grid.insert(Ball.new(:"?"), 2)
    @grid.insert(Ball.new(3), 3)
    @grid.insert(Ball.new(4), 4)
    @grid.insert(Ball.new(5), 5)

    assert_equal @grid.row(1).inspect, "[nil, 6, nil, nil, nil, nil, nil]"
    assert_equal @grid.row(0).inspect, "[?, 6, ?, 3, 4, 5, nil]"

    @grid.explode!

    assert_equal @grid.row(1).inspect, "[nil, nil, nil, nil, nil, nil, nil]"
    assert_equal @grid.row(0).inspect, "[??, 6, ??, 3, 4, 5, nil]"
  end
end
