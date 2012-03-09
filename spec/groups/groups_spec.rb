require 'spec_helper'

describe Group do
  before do
    @admin = Factory(:user, email: "admin@admin.com", pasword: "cacawete") 
    @group = Factory(:group)
  end
  it "checking if user belongs to group" do
    @group.user << @admin
    @user.group.should be(@group)
  end
end


