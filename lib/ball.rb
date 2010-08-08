module DropX
  class Ball
    attr_accessor :value
    def initialize(value = :"?")
      @value = value
    end

    def inspect
      @value.to_s
    end

    def advance_state!
      @value = (case value
      when :"?"
        :"??"
      when :"??"
        rand(7) + 1
      when Fixnum
        value
      end)
      self
    end

    class << self
      def next
        # magic number; I'm just going to say ? balls happen 33% of the time
        self.new(rand(9) > 2 ? (rand(7) + 1) : :"?")
      end
    end
  end
end
