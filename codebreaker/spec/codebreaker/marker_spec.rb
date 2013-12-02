require "spec_helper"
module Codebreaker
  describe Marker do
    let(:marker) { Marker.new("1234") }
    describe "#exact_match_count" do
      context "with no matches" do
        it "return 0" do
          marker.guess = '5555'
          expect(marker.exact_match_count).to be(0)
        end
      end

      context "with 1 exact match" do
        it "return 1" do
          marker.guess = '1555'
          expect(marker.exact_match_count).to be(1)
        end
      end

      context "with 1 number match" do
        it "return 0" do
          marker.guess = '2555'
          expect(marker.exact_match_count).to be(0)
        end
      end

      context "with 1 exact match and 1 number match" do
        it "return 1" do
          marker.guess = '1525'
          expect(marker.exact_match_count).to be(1)
        end
      end
    end

    describe "#number_match_count" do
      context "with no matches" do
        it "return 0" do
          marker.guess = '5555'
          expect(marker.number_match_count).to be(0)
        end
      end

      context "with 1 exact match duplicated in guess" do
        it "return 0" do
          marker.guess = '1155'
          expect(marker.number_match_count).to be(0)
        end
      end

      context "with 1 exact match" do
        it "return 0" do
          marker.guess = '1555'
          expect(marker.number_match_count).to be(0)
        end
      end

      context "with 1 number match" do
        it "return 1" do
          marker.guess = '2555'
          expect(marker.number_match_count).to be(1)
        end
      end

      context "with 1 exact match and 1 number match" do
        it "return 1" do
          marker.guess = '1525'
          expect(marker.number_match_count).to be(1)
        end
      end
    end
  end
end
