module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @output.puts "코드 브레이커!"
      @output.puts "입력:"
      @secret = secret.split("").map(&:to_i)
    end

    def guess(guess)
      @guess = guess.split("").map(&:to_i)
      @output.puts mark
    end

    def mark
      common_number = @secret & @guess
      plus_size = common_number.select { |i| @secret.index(i) == @guess.index(i) }.size
      minus_size = common_number.size - plus_size

      "+" * plus_size + "-" * minus_size
    end
  end
end
