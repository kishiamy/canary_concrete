require 'spec_helper'
describe 'new page with globalize' do
  before do
    @admin = FactoryGirl.create(:admin)
    login @admin
    visit pages_path
    click_on "New"
    fill_in "page_title", :with => "Test"
    #fill_in "page_content", :with => "this is a test"
    fill_in "page_translations_attributes_1_title", :with => "Prueba"
    #fill_in "page_translations_attributes_1_content", :with => "Pruebaaaa"
    click_on "Create page"
  end
  it 'check if translations works properly' do
    page = Page.find_by_title("Test")
    page.title.should == "Test" 
    page.translations.locale.should == 'es'
    page.translations.page_title.should == 'Prueba'
    #Page.find_by_title("Test").translations.last.title.should == "Probando"
    #Page.find_by_title("Test").translations.last.content.should == "Pruebaaaa"
  end
end
