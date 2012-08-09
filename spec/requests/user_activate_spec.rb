require 'spec_helper'

describe "activate user" do
    before do
      @user = FactoryGirl.create(:user)
      login @user
    end
    it "successfully" do
      current_path.should == user_session_path
    end
end
