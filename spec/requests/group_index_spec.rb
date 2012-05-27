require 'spec_helper'

describe "groups index" do
  describe "admin visit" do
    before do
      @admin = Factory(:admin)
      login @admin
    end

    it "doesn't has alert" do
      visit groups_path(:locale => 'en')
      current_path.should == groups_path(:locale => 'en')
    end
  end

  describe "user visit" do
    before do
      @user = Factory(:user)
      login @user
    end

    it "has alert" do
      visit groups_path(:locale => 'en')
      page.should have_content("You do not have permission to be here!")
    end
  end

  describe "without login" do
    it "user without login" do
      visit groups_path(:locale => 'en')
      page.should have_content("You do not have permission to be here!")
    end
  end
end
