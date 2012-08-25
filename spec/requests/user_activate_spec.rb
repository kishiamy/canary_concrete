require 'spec_helper'

describe "activate user" do
    before do
      @admin = FactoryGirl.create(:admin)
      @user = FactoryGirl.create(:user, approved: false)
      login @admin
      visit manage_activations_path
      click_on "Activate" 
      check("approved")
      find('.btn').click
    end
    it "successfully" do
      User.find(@user.id).approved.should == true
    end
end
