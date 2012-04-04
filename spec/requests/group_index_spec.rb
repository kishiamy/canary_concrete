require 'spec_helper'

describe "groups index" do
  describe "admin visit" do
    before do
      @admin = User.first
      login admin
      visit groups_path
    end
    it "don't have alert", :js => true do
      page.should_not  have_content("You don't have permission to be here!")
    end
  end

  describe "user visit" do
    before do
      @user.User.find(:group_id => 2)
      login user
      visit groups_path
    end
    it "have alert", :js => true do
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
