require 'spec_helper'

describe Group do
  before do
    @admin = Factory(:user, email: "admin@admin.com", password: "cacawete") 
    @group = Factory(:group)
  end
  it "checking if user belongs to group" do
    @user.group << @admin			 #AQUI ES DONDE PETA
    @user.group.should be(@group)
  end
end


