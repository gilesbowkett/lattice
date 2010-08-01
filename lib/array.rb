class Array
  def full?
    self == self.compact
  end

  def sequence?(ball)
    subsequence(ball).ball_value_matches_subsequence_size?(ball)
  end

  def subsequence(ball)
    biggest_subseq = []
    (0..7).each do |first|
      (0..7).each do |last|
        current_subseq = self[first..last]
        unless current_subseq.include?(nil) or current_subseq.empty?
          if current_subseq.include?(ball) and biggest_subseq.size < current_subseq.size
            biggest_subseq = self[first..last]
          end 
        end 
      end 
    end 
    biggest_subseq
  end

  def ball_value_matches_subsequence_size?(ball)
    ball.value == self.compact.size
  end

  def drop
    self.compact!
    (self.size..6).each do |index|
      self[index] = nil 
    end 
    self
  end
end
