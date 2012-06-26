require 'spec_helper'

describe "delete page" do
  before do
    @admin = FactoryGirl.create(:admin)
    FactoryGirl.create(:page)
    @page = FactoryGirl.create(:page, title: "hello")
    @count = Page.count
    login @admin
    visit pages_path
    find(".btn-danger[href='#{page_path(@page)}']").click
    page.driver.browser.switch_to.alert.accept
  end
  it "group was deleted successfully" do
    wait_until_we_see(".container")
    current_path.should == pages_path
    Page.count.should be_eql (@count - 1)  
  end
end
