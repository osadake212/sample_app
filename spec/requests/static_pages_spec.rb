require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "GET /static_pages" do
  	it "sould have the content 'Sample App'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Sample App')
  	end
  end
end
