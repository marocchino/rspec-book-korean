require 'spec_helper'

describe "messages/new.html.erb" do
  let(:message) {  mock_model("Message").as_new_record.as_null_object }
  before {assign(:message, message)}
  it "displays the text attribute of the message" do
    render
    expect(rendered).to have_selector("form", method: "post", action: messages_path) do |form|
      expect(form).to have_selector("input", type: "submit")
    end
  end

  it "renders a text field for the message title" do
    message.stub(title: "the title")
    render
    expect(rendered).to have_selector("form", method: "post", action: messages_path) do |form|
      expect(form).to have_selector("input", type: "text", name: "message[title]", value: "the title")
    end
  end

end
