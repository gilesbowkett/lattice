%w{rubygems test/unit}.each {|lib| require lib}
require File.join(File.dirname(__FILE__), "../lib/dropX")
include DropX

class DropXTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new
    @ball = Ball.new
  end

  def test_ball
    assert @ball
  end

  def test_grid
    assert @grid
  end
end
