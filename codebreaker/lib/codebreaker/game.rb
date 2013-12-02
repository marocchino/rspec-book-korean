module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @output.puts "코드 브레이커!"
      @output.puts "입력:"
      @marker= Marker.new secret
    end

    def guess(guess)
      @output.puts @marker.print_with(guess)
    end
  end
end
