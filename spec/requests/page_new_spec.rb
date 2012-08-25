require 'spec_helper'
describe 'new page with globalize' do
  before do
    @admin = FactoryGirl.create(:admin)
    login @admin
    visit pages_path
    click_on "New"
    fill_in "page_title", :with => "Test"
    fill_in "page_translations_attributes_1_title", :with => "Prueba"
    click_on "Create page"
  end
  it 'check if translations works properly' do
    I18n.locale = :en
    page = Page.find_by_title("Test")
    page.title.should == "Test" 
    I18n.locale = :es
    page.title.should == 'Prueba'
  end
end
