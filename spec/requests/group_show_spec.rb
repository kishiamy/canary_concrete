require 'spec_helper'

describe "show group" do
    before do
      @admin = FactoryGirl.create(:admin)
      @group = FactoryGirl.create(:group, name: "Extras")
      login @admin
      visit groups_path
      sleep 1
      find("a[href='#{group_path(@group)}']").click
    end
    it "check name" do
      current_path.should == group_path(@group)
    end
end
