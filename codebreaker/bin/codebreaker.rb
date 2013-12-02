#!/usr/bin/env ruby
$LOAD_PATH.push File.join(File.dirname(__FILE__), "/../lib")
require 'codebreaker'

def generate_secret_code
  [*1..6].sort_by{ rand }[0,4].map(&:to_s).join("")
end

game = Codebreaker::Game.new(STDOUT)
secret_code = generate_secret_code
at_exit { puts "secret_code was #{secret_code}" }
game.start(secret_code)
while guess = gets.chomp
  game.guess(guess)
end
