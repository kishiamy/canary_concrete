require'spec_helper'
describe "delete group" do
  it "group was deleted successfully" do
    group = FactoryGirl.create(:group)
    size = Group.count
    group.destroy
    Group.count.should < size
  end
end
