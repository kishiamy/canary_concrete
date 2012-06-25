require 'spec_helper'

describe "groups index" do
  describe "admin visit" do
    before do
      @admin = FactoryGirl.create(:admin)
      login @admin
    end

    it "doesn't has alert" do
      visit groups_path
      current_path.should == groups_path
    end
  end

  describe "user visit" do
    before do
      @user = FactoryGirl.create(:user)
      login @user
    end

    it "has alert" do
      visit groups_path
      page.should have_content("You do not have permission to be here!")
    end
  end

  describe "without login" do
    it "user without login" do
      visit groups_path
      page.should have_content("You do not have permission to be here!")
    end
  end
end
