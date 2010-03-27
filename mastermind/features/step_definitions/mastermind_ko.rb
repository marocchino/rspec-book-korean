
Given /^나는 아직 시작하지 않았습니다$/ do
end

When /^새 게임을 시작합니다$/ do
	@messenger = StringIO.new
	game = Mastermind::Game.new(@messenger)	
	@message = game.start
end

Then /^화면에 "([^\"]*)"(?:을|를) 표시해야 합니다$/ do |message|
	@messenger.string.split("\n").should include(message)
end
