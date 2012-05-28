require 'spec_helper'

describe "edit group" do
    before do
      @admin = Factory(:admin)
      @group = Factory(:group, name: "Extras")
      login @admin
      visit groups_path
      find("a[href='#{edit_group_path(@group)}']").click
      fill_in "Name", :with => "Without permission"
      click_on "Update Group"
    end
    it "check the name" do
      Group.find_by_name("Without permission").name.should == "Without permission"
    end
end
