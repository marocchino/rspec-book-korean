require 'spec_helper'

describe MessagesController do
  describe "POST create" do
    let(:message) { mock_model("Message").as_null_object }

    before { Message.stub new: message }

    it "create a new message" do
      Message.should_receive(:new).with("text" => "a quick brown").and_return(message)
      post :create, message: {"text" => "a quick brown"}
    end

    it "saves the message" do
      message.should_receive(:save)
      post :create, message: {}
    end

    context "when save successfully" do
      before { message.stub(:save).and_return(true) }
      it "sets a flash[:notice] message" do
        post :create, message: {}
        flash[:notice].should eq("The message was saved successfully")
      end

      it "redirects to the Messages index" do
        post :create, message: {}
        expect(response).to redirect_to(action: "index")
      end
    end

    context "when the message fails to save" do
      before { message.stub(:save).and_return(false) }
      it "assigns @message" do
        post :create, message: {}
        assigns[:message].should eq(message)
      end

      it "renders the new template" do
        post :create, message: {}
        expect(response).to render_template("new")
      end
    end
  end

end
