module Mastermind
	class Game
		def initialize(messenger)
			@messenger = messenger
		end
		#
		#=== welcome message
		#
		# "마스터마인드!"
		#
		def start# {{{
			@messenger.puts "마스터마인드!"
			@messenger.puts "입력:"

		end# }}}
	end
end
