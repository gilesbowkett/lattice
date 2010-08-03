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
      when Fixnum
        value
      end)
    end

    class << self
      def next
        # magic number; I'm just going to say grey balls happen 30% of the time
        self.new(rand(9) > 2 ? (rand(6) + 1) : :grey)
      end
    end
  end
end
