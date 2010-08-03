require File.join(File.dirname(__FILE__), "/test_helper")

class GreyTest < DropXTest
  def test_advance_state
    # simplest state machine ever
    assert_equal :grey, @ball.value
    @ball.advance_state!
    assert_equal :grey2, @ball.value
    @ball.advance_state!
    assert @ball.value.is_a?(Fixnum)
  end
  def test_blowback
    # collect all the coordinates for explosions, and then communicate
    # the blowback to the balls one unit away. grey balls don't change
    # on explosion; they change on proximity to it.
    (0..5).each {|column| @grid.insert(Ball.new, column)}
    @ball.value = 7
    @grid.insert(@ball, 6)
  
    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, grey, grey, 7]"
    @grid.explode!
    assert_equal @grid[0].inspect, "[grey, grey, grey, grey, grey, grey2, nil]"
  end
end
