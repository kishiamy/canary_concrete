require 'spec_helper'

describe "delete group" do
    before do
      @admin = FactoryGirl.create(:admin)
      @group = FactoryGirl.create(:group, name: "Delete_me")
      login @admin
      @count = Group.count
      visit groups_path
      find(".btn-danger[href='#{group_path(@group)}']").click
      page.driver.browser.switch_to.alert.accept
    end
    it "group was deleted successfully" do
      sleep 1
      current_path.should == groups_path
      Group.count.should be_eql (@count - 1)  
    end
end
