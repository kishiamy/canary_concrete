require 'spec_helper'
describe "update attributes" do
  it 'group updated correctly' do
    @group = FactoryGirl.create(:group, name: 'Class')
    @group.update_attributes(name: 'newgroup')
    Group.find_by_name('newgroup')
  end 
end
