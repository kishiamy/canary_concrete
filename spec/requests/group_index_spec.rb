require 'spec_helper'

describe "groups index" do
  describe "admin visit" do
    before do
      @admin = Factory(:admin, email: "admin@admin.com", password: "adminadmin",  password_confirmation: "adminadmin")
      login @admin
    end

    it "dosen't has alert" do
      visit groups_path
      current_path.should == groups_path
    end
  end

  describe "user visit" do
    before do
      @user = Factory(:user)
      login @user
    end

    it "has alert" do
      visit groups_path
      page.should have_content("You don't have permission to be here!")
    end
  end

  describe "without login" do
    it "user without login" do
      visit groups_path
      page.should have_content("You don't have permission to be here!")
    end
  end
end
