module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @output.puts "코드 브레이커!"
      @output.puts "입력:"
    end

    def guess(guess)

    end
  end
end
