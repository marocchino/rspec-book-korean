class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end
Given (/^나는 아직 시작하지 않았습니다$/) do
end

When (/^새 게임을 시작합니다$/) do
  Codebreaker::Game.new(output).start('1234')
end

Then (/^화면에 "([^\"]*)"(?:을|를) 표시해야 합니다$/) do |message|
  output.messages.should include(message)
end

Given (/^시크릿 코드는 "(.*?)"$/) do |secret|
  @game = Codebreaker::Game.new(output)
  @game.start(secret)
end

When (/^"(.*?)"를 추측합니다$/) do |guess|
  @game.guess(guess)
end

Then (/^표시는 "(.*?)"이어야 합니다$/) do |mark|
  output.messages.should include(mark)
end
