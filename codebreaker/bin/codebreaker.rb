#!/usr/bin/env ruby
$LOAD_PATH.push File.join(File.dirname(__FILE__), "/../lib")
require 'codebreaker'
game = Codebreaker::Game.new(STDOUT)
game.start('1234')
while guess = gets.chomp
  game.guess(guess)
end
