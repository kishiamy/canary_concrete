require 'spec_helper'

describe "new pages" do
    before do
      @admin = FactoryGirl.create(:admin)
      login @admin
      visit pages_path
      click_on ("New page")
      fill_in "Title", :with => "test page"
      click_on ("Create page")
    end
    it "check the title" do
      Page.find_by_title("test page").title.should == "test page"
    end
end
