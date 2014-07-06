require 'spec_helper'

describe "StaticPages" do

  subject { page }

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

    describe "for singed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
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
