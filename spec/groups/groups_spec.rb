require 'spec_helper'

describe Group do
  before do
    @admin = Factory(:user, email: "admin@admin.com", password: "cacawete") 
    @group = Factory(:group, name: "admin")
  end

  it "checking if user belongs to group" do
    @admin.group = @group	
    @admin.save
    @admin.group.should be(@group)
  end

end


