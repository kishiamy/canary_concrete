require 'spec_helper'

describe "show page" do
    before do
      @page = FactoryGirl.create(:page, title: "Test show", content: "this is a content")
      visit page_path(@page)
    end
    it "check page" do
      current_path.should == page_path(@page)
      page.should have_content("Test show")
      page.should have_content("this is a content")
    end
end
