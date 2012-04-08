require 'spec_helper'

describe "delete group" do
    before do
      @admin = Factory(:admin)
      @group= Factory(:group, name: "Delete_me")
      login @admin
      visit groups_path
      find(".btn-danger[href='#{group_path(@group)}']").click
      page.driver.browser.switch_to.alert.accept
    end
    it "group was deleted successfully" do
      Group.count.should == 1
    end
end
