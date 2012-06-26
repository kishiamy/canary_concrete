require "spec_helper"

describe "manage groups" do
  before do
    @admin = FactoryGirl.create(:admin)
    @group = FactoryGirl.create(:group, name: "Bot")
    @user = FactoryGirl.create(:user)
    login @admin
    visit user_list_path
    find("#edit_user_#{@user.id} select").select("Bot")
    find("#edit_user_#{@user.id} .btn").click
  end

  it "change group" do
    User.find(@user).group.name.should == "Bot"
  end
end
