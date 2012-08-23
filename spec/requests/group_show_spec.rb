require 'spec_helper'

describe "show group" do
    before do
      @admin = FactoryGirl.create(:admin)
      @group = FactoryGirl.create(:group, name: "Extras")
      login @admin
      visit groups_path
      find("a",  :text => @group.name ).click
    end
    it "check name" do
      current_path.should == group_path(@group)
    end
end
