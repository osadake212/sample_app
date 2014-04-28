require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/home" do
    before { visit root_path}
    it "should have the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      expect(page).not_to have_title('| Home')
    end
  end

  describe "GET /static_pages/help" do
  	it "sould have the content 'Sample App'" do
  		visit help_path
  		expect(page).to have_content('Sample App')
  	end
  end

  describe "Get /static_pages/about" do
    it "should have the content 'Sample App'" do
      visit about_path
      expect(page).to have_content('About Us')
    end
  end

  describe "Get /static_pages/contact" do
    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
