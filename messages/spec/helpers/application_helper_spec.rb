require 'spec_helper'

describe ApplicationHelper do
  describe "#display_for(:role)" do
    context "when the current user has the role" do
      it "display the content" do
        user = double('User', in_role?: true)
        helper.stub(current_user: user)
        content = helper.display_for(:existing_role) { "content" }
        expect(content).to eq("content")
      end
    end
    context "when the current user does not have the role" do
      it "does not display the content" do
        user = double('User', in_role?: false)
        helper.stub(current_user: user)
        content = helper.display_for(:existing_role) { "content" }
        expect(content).to be_nil
      end
    end
  end
end
