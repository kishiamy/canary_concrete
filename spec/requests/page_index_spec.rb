require 'spec_helper'

describe "pages index" do
  describe "admin visit" do
    before do
      @admin = FactoryGirl.create(:admin)
      login @admin
    end

    it "doesn't has alert" do
      visit pages_path
      current_path.should == pages_path
    end
  end

  describe "user visit" do
    before do
      @user = FactoryGirl.create(:user)
      login @user
    end

    it "has alert" do
      visit pages_path
      page.should have_content("You do not have permission to be here!")
    end
  end

  describe "without login" do
    it "user without login" do
      visit pages_path
      page.should have_content("You do not have permission to be here!")
    end
  end

  describe "creating a new page in two languages" do
     before do
      @admin = FactoryGirl.create(:admin)
      @page = FactoryGirl.create(:page, title: "New", content: "This page is new")
      login @admin
      visit page_path
      find("a[href='en/pages/id']").click
      find("a[href='es/pages/id']").click
    end
    it "check both languages are created correctly" do 
      Page.find_by_title("New").title.should == "Nuevo"
    end
  end
end
