require File.join(File.dirname(__FILE__), "/test_helper")

class CombinedExplosionsTest < DropXTest
  def test_combined_explosion
    (0..4).each {|column| @grid.insert(Ball.new, column)}

    @ball.value = 7
    @grid.insert(@ball, 5)

    @b2 = Ball.new(2)
    @grid.insert(@b2, 5)

    @b3 = Ball.new(1)
    @grid.insert(@b3, 6)

    # combined_explosion_1.html
    assert_equal @grid.row(0).inspect, "[grey, grey, grey, grey, grey, 7, 1]"
    assert_equal @grid.row(1).inspect, "[nil, nil, nil, nil, nil, 2, nil]"

    @grid.explode!
    assert_equal @grid.row(0).inspect, "[grey, grey, grey, grey, grey2, nil, nil]"
    assert_equal @grid.row(1).inspect, "[nil, nil, nil, nil, nil, nil, nil]"
  end

  def test_out_of_sequence_non_explosions
    @grid.insert(Ball.new(4), 0)
    @grid.insert(Ball.new(5), 2)
    @grid.insert(Ball.new(3), 5)
    @grid.insert(Ball.new(7), 6)
    assert_equal @grid.row(0).inspect, "[4, nil, 5, nil, nil, 3, 7]"
    @grid.explode!
    assert_equal @grid.row(0).inspect, "[4, nil, 5, nil, nil, 3, 7]"
  end
end
