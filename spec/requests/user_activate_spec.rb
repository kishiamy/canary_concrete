require 'spec_helper'

describe "activate user" do
    before do
      @admin = FactoryGirl.create(:admin)
      @admin.update_attribute(:approved, true)
      @user = FactoryGirl.create(:user)
      login @admin
      click_on "Users"
      click_on "Activate" 
      find(:id, "approved", "#{@user.approved}").click
      click_on "Activate"
      logout 
      login @user
    end
    it "successfully" do
      page.should have_content("You do not have permission to be here!")
    end
end
