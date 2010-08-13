%w{rubygems test/unit}.each {|lib| require lib}
require File.join(File.dirname(__FILE__), "../lib/dropX")
include DropX

class DropXTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new
    @ball = Ball.new
  end

  # this is a broken window, but it gets me Test subclasses stupid-quick. (unfortunately putting the stupid
  # in stupid-quick)
  def test_true
    assert true
  end
end
