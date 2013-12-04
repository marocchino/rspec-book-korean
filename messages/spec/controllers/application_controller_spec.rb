require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      raise AccessDenied
    end
  end
  describe "handing AccessDenied exceptions" do
    it "redirect to the /401.html (access denied) page" do
      get :index
      expect(response).to redirect_to('/401.html')
    end
  end

end
