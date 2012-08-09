require 'spec_helper'

describe "activate user" do
    before do
      @admin = FactoryGirl.create(:admin)
      @admin.update_attribute(:approved, true)
      @user = FactoryGirl.create(:user)
      login @admin
      click_on "Users"
      click_on "Activate" 
      find(:id, "#{@user.approved}").click
      click_on "Activate"
      logout 
      visit user_session_path
      login @user
    end
    it "not successfylly" do
      current_path.should == user_session_path
    end
end
