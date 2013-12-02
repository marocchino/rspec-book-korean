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

  def match_numbers
    @secret & @guess
  end

  def exact_match_count
    match_numbers.select { |i| @secret.index(i) == @guess.index(i) }.size
  end

  def number_match_count
    match_numbers.size - exact_match_count
  end
end
