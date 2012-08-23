require 'spec_helper'
describe 'globalize' do
  before do
    @admin = FactoryGirl.create(:admin)
    login @admin
    visit pages_path
    click_on ("New")

    fill_in "Title", :with => "Test"
    fill_in "Content", :with => "this is a test"
    fill_in "page_translations_attributes_1_title", :with => "Probando"
    fill_in "page_translations_attributes_1_content", :with => "Pruebaaaa"
    click_on "Create page"
  end
  it 'check if translations works properly' do
    Page.find_by_title("Test").title.should == "Test" 
    Page.find_by_title("Test").content.should == "this is a test" 
    Page.find_by_title("Test").translations.last.title.should == "Probando"
    Page.find_by_title("Test").translations.last.content.should == "Pruebaaaa"
  end
end
