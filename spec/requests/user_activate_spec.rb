require 'spec_helper'

describe "activate user" do
    before do
      @user = FactoryGirl.create(:user, email: "ejemplo@ejemplo.com", password: "ejemploejemplo")
      visit user_session_path(@user)
      login @user
    end
    it "activation with successfully" do
      current_path.should == pages_path
    end
end
