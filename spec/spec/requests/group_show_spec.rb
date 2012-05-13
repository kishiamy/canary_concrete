require 'spec_helper'

describe "show group" do
    before do
      @admin = Factory(:admin)
      @group = Factory(:group, name: "Extras")
      login @admin
      visit groups_path
      find("a",  :text => @group.name ).click
    end
    it "check name" do
      current_path.should == group_path(@group)
    end
end
