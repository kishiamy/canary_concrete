require 'spec_helper'

describe "groups index" do
  describe "admin visit" do
    before do
      visit new_user_session_path
      #login admin 
      fill_in "Email", :with => "admin@admin.com"
      fill_in "Password", :with => "adminadmin"
      find(".actions .btn").click
      visit groups_path
    end

    it "has alert", :js => true do
      page.should_not have_content("You don't have permission to be here!")
    end
  end

  describe "user visit" do
    before do
      @user = User.last
      #login user
      visit groups_path
    end
    it "has alert", :js => true do
      page.should have_content("You don't have permission to be here!")
      visit root_path
    end
  end

  describe "without login" do
    it "user without login", :js => true do
      page.should have_content("You don't have permission to be here!")
      visit root_path
    end
  end
end
