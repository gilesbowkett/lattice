module DropX
  class Ball
    attr_accessor :value
    def initialize(value = :grey)
      @value = value
    end

    def inspect
      @value.to_s
    end
  end
end
