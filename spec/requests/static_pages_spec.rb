require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/home" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "GET /static_pages/help" do
  	it "sould have the content 'Sample App'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Sample App')
  	end
  end

  describe "Get /static_pages/about" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
end
