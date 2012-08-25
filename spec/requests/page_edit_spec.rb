require 'spec_helper'

describe "edit page" do
    before do
      @admin = FactoryGirl.create(:admin)
      @page = FactoryGirl.create(:page, title: "Update")
      login @admin
      visit pages_path
      find("a[href='#{edit_page_path(@page)}']").click
      fill_in "Title", :with => "Updated"
      click_on "Update page"
    end
    it "check the title" do
      Page.find_by_title("Update").title.should == "Update"
    end
end
