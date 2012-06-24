require 'spec_helper'

describe "edit page" do
    before do
      @admin = FactoryGirl.create(:admin)
      @page = FactoryGirl.create(:page, title: "Update")
      login @admin
      visit pages_path
      find("a[href='#{edit_page_path(@page)}']").click
      fill_in "Title", :with => "Page updated"
      click_on "Update Page"
    end
    it "check the title" do
      debugger
      Page.find_by_title("Page updated").title.should == "Page updated"
    end
end
