require File.join(File.dirname(__FILE__), "/test_helper")

class ArrayTest < DropXTest
  def test_sequence
    @b4 = Ball.new(4)
    assert [@b4, Ball.new, Ball.new, Ball.new, nil, nil, nil].sequence?(@b4)
    assert ! [@b4, nil, Ball.new, nil, Ball.new, nil, Ball.new].sequence?(@b4)
  end

  def test_subsequence
    assert_equal [1, 2, 3, 4], [1, 2, 3, 4, nil, nil, nil].subsequence(4)
    assert_equal [1, 2, 3, 4], [nil, nil, nil, 1, 2, 3, 4].subsequence(4)
    assert_equal [1, 2, 3, 4], [nil, 1, 2, 3, 4, nil, nil].subsequence(4)
    assert_equal [1, 2, 3], [nil, 1, 2, 3, nil, 7, 3].subsequence(3)
    assert_equal [4, 4, 4, 4], [4, 4, 4, 4, nil, nil, nil].subsequence(4)
  end

  def test_drop
    assert_equal [1, 2, 3, 4, 5, 6, nil], [nil, 1, 2, 3, 4, 5, 6].drop
    assert_equal [1, 4, 6, nil, nil, nil, nil], [nil, 1, nil, nil, 4, nil, 6].drop
  end

end
