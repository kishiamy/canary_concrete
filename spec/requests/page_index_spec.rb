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
      login @admin
      visit pages_path
      click_on('New')
      fill_in 'Title', :with => 'testing'
      page.execute_script("$('#cke_page_content table iframe').contents().find('p').text('It is a test')")
      sleep 1
      fill_in "page_translations_attributes_1_title", :with => 'testeando'
      page.execute_script("$('#cke_page_translations_attributes_1_content table iframe').contents().find('p').text('esto es un test')")
      sleep 1
      click_on 'Create page'
    end
    it "check both languages are created correctly" do 
      I18n.locale = :en
      eng = Page.find_by_title("testing").id
      I18n.locale = :es
      es = Page.find_by_title("testeando").id
      eng.should == es
    end
  end
end
