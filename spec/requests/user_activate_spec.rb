require 'spec_helper'

describe "activate user" do
    before do
      @user = FactoryGirl.create(:user, email: "ejemplo@ejemplo.com", password: "ejemploejemplo")
      visit page_path(@user)
    end
    it "activation with successfully" do
      current_path.should == page_path(@page)
      page.should have_content("Test show")
      page.should have_content("this is a content")
    end
end
