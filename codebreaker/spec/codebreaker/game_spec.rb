require File.join(File.dirname(__FILE__), "/../spec_helper")
module Codebreaker
  describe Game do
    context "starting up" do
      let(:output) { double("output").as_null_object }
      let(:game) { Game.new(output) }
      it "send a welcome message" do
        output.should_receive(:puts).with("코드 브레이커!")
        game.start('1234')
      end
      it "prompts for 1st guess" do
        output.should_receive(:puts).with("입력:")
        game.start('1234')
      end
    end
  end
end
