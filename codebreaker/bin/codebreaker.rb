#!/usr/bin/env ruby
$LOAD_PATH.push File.join(File.dirname(__FILE__), "/../lib")
require 'codebreaker'
game = Codebreaker::Game.new(STDOUT)
messages = game.start