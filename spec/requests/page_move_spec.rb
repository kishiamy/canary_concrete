require 'spec_helper'

describe "moving page" do
    before do
      @admin = FactoryGirl.create(:admin)
      @father = FactoryGirl.create(:page, title: "father", content: "this is a content of father")
      @child = FactoryGirl.create(:page, title: "child", content: "this is a content of child", page_id: @father.id)
      @mother = FactoryGirl.create(:page, title: "mother", content: "this is a content of mother")
      login @admin
      visit pages_path
      find("a[href='#{move_page_path(@child)}']").click
    end

    it "check if move to nav bar" do
      wait_until_we_see(".content")
      current_path.should == move_page_path(@child)
      find(:id, "nav-bar").click
      click_on "Update section"
      wait_until_we_see(".content")
      current_path.should == pages_path
      page.should have_content('Page was successfully moved.')
      Page.find_by_title('child').page.should == nil
    end

    it "check if move to parent" do
      find(:id, "#{@mother.id}").click
      click_on "Update section"
      wait_until_we_see(".content")
      current_path.should == pages_path
      page.should have_content('Page was successfully moved.')
      Page.find_by_title('child').page.should == @mother
    end
end
