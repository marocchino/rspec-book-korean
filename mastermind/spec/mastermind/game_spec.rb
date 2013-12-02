require File.join(File.dirname(__FILE__), "/../spec_helper")
module Mastermind
  describe Game do
    context "starting up" do
      let(:messenger) { double("messenger").as_null_object }
      let(:game) { Game.new(messenger) }
      it "should send a welcome message" do
        messenger.should_receive(:puts).with("마스터마인드!")
        game.start
      end
      it "should prompt for 1st guess" do
        messenger.should_receive(:puts).with("입력:")
        game.start
      end
    end
  end
end
