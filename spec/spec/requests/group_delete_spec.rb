require 'spec_helper'

describe "delete group" do
    before do
      @admin = Factory(:admin)
      @group = Factory(:group, name: "Delete_me")
      login @admin
      @count = Group.count
      visit groups_path
      find(".btn-danger[href='#{group_path(@group)}']").click
      sleep 0.1
      page.driver.browser.switch_to.alert.accept

    end
    it "group was deleted successfully" do
      wait_until_we_see(".container")
      current_path.should == groups_path
      Group.count.should be_eql (@count - 1)  
    end
end
