require 'spec_helper'
describe "create group correctly" do
  it "group assigned correctly to user" do
    id = Factory(:group, name: "test").id
    Group.find(id).name.should == "test"
  end
end
