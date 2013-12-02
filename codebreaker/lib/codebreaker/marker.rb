class Marker
  def initialize(secret)
    @secret = secret.split("").map(&:to_i)
  end

  def print_with(guess)
    self.guess = guess
    "+" * exact_match_count + "-" * number_match_count
  end

  def guess=(guess)
    @guess = guess.split("").map(&:to_i)
  end

  def exact_match_count
    (0..3).select { |i| @secret[i] == @guess[i] }.size
  end

  def total_match_count
    @secret.select { |i| @guess.include?(i) }.size
  end

  def number_match_count
    total_match_count - exact_match_count
  end
end
