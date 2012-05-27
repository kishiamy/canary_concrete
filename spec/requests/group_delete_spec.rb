require 'spec_helper'

describe "delete group" do
    before do
      @admin = Factory(:admin)
      @group = Factory(:group, name: "Delete_me")
      login @admin
      @count = Group.count
      visit groups_path(:locale => 'en')
      find(".btn-danger[href='#{group_path(@group, :locale => 'en')}']").click
      page.driver.browser.switch_to.alert.accept
    end
    it "group was deleted successfully" do
      current_path.should == groups_path(:locale => 'en')
      Group.count.should be_eql (@count - 1)  
    end
end
