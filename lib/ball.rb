module DropX
  class Ball
    attr_accessor :value
    def initialize(value = :grey)
      @value = value
    end

    def inspect
      @value.to_s
    end

    def advance_state!
      @value = (case value
      when :grey
        :grey2
      when :grey2
        rand(6) + 1
      end)
    end
  end
end
