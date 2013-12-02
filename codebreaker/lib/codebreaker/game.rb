module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end
    def start
      @output.puts "코드 브레이커!"
      @output.puts "입력:"
    end
  end
end
