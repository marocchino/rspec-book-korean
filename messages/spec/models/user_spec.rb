require 'spec_helper'

describe User do
  describe "#send_message" do
    let(:zach) { User.create! subscription: Subscription.new }
    let(:david) { User.create! }
    let(:msg) { zach.send_message(recipient: david, title: "Book Update", text: "Beta 11") }
    context "when the user is under their subscription limit" do
      before { zach.subscription.stub can_send_message?: true }
      it "sends a message to another user" do
        expect(david.received_messages).to include(msg)
      end
      it "creates a new message with the submitted attributes" do
        expect(msg.title).to eq("Book Update")
        expect(msg.text).to eq("Beta 11")

      end
      it "adds the message to the sender's sent messages" do
        expect(zach.sent_messages).to include(msg)
      end
    end
    context "when the user is over their subscription limit" do
      before { zach.subscription.stub can_send_message?: false }
      it "does not create a messages" do
        expect{ msg }.to_not change(Message, :count)
      end
    end
  end
end
