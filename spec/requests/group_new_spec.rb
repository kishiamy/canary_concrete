require 'spec_helper'

describe "new group" do
    before do
      @admin = Factory(:admin)
      login @admin
      visit groups_path
      click_on ("New Group")
      fill_in "Name", :with => "My new group"
      click_on ("Create Group")
    end
    it "check the name" do
      Group.find_by_name("My new group").name.should == "My new group"
    end
end