require 'spec_helper'

describe "groups index" do
  describe "admin visit" do
    before do
      @admin = Factory(:admin)
      login @admin
    end

    it "don't has alert" do
      visit groups_path
      page.should_not have_content("You don't have permission to be here!")
    end
  end

  describe "user visit" do
    before do
      @user = Factory(:user)
      login @user
    end
    it "has alert", :js => true do
      visit groups_path
      page.should have_content("You don't have permission to be here!")
    end
  end

  describe "without login" do
    it "user without login", :js => true do
      visit groups_path
      page.should have_content("You don't have permission to be here!")
    end
  end
end
