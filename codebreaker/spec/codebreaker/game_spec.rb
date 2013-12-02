require File.join(File.dirname(__FILE__), "/../spec_helper")
module Codebreaker
  describe Game do
    let(:output) { double("output").as_null_object }
    let(:game) { Game.new(output) }
    describe "#start" do
      it "send a welcome message" do
        output.should_receive(:puts).with("코드 브레이커!")
        game.start('1234')
      end
      it "prompts for 1st guess" do
        output.should_receive(:puts).with("입력:")
        game.start('1234')
      end
    end
    describe "#guess" do
      context "with no matches" do
        it "sends mark with ''" do
          game.start('1234')
          output.should_receive(:puts).with('')
          game.guess('5555')
        end
      end

      context "with 1 number matches" do
        it "sends mark with '-'" do
          game.start('1234')
          output.should_receive(:puts).with('-')
          game.guess('2555')
        end

        it "sends mark with '+'" do
          game.start('1234')
          output.should_receive(:puts).with('+')
          game.guess('1555')
        end
      end

      context "with 2 number matches" do
        it "sends mark with '--'" do
          game.start('1234')
          output.should_receive(:puts).with('--')
          game.guess('2355')
        end

        it "sends mark with '+-'" do
          game.start('1234')
          output.should_receive(:puts).with('+-')
          game.guess('3255')
        end
        it "sends mark with '++'" do
          game.start('1234')
          output.should_receive(:puts).with('++')
          game.guess('1255')
        end
      end

    end
  end
end
