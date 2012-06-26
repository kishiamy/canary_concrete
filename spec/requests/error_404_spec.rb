require 'spec_helper'
describe 'show 404 error' do
  it "successfully" do
    visit groups_path + "t"  
    page.should have_content("404 Error")
  end
end
