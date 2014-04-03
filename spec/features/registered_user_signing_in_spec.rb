require 'spec_helper'

feature 'user trying to sign in', %q{
  As a registered user
  I can sign in when I navigate to the site
  So I can use the cool features
  } do

  # AC:
  # I have to enter in a email
  # I have to enter in a password
  # When I am not signed up I can't visit certain pages

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  context 'filling out user information' do

    it 'it signs you in when you give valid entries' do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Sign Out')
    end

    it "gives you an error message when you don't give it an email" do
      visit new_user_session_path
      fill_in "Email", with: ""
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

    it "gives you an error message when you don't give it an password" do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: ""
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

    it "gives you an error when you enter in incorrect password" do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "asfaslkfjaslfjklasdjfljaskljf;adsflajfl"
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

    it "gives you an error when you enter in unregistered email" do
      visit new_user_session_path
      fill_in "Email", with: "iamnotregistered@iamnotregistered.com"
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

  end

  context 'visiting pages while not signed in' do

    # it 'redirects you to the sign in page when you are not signed in'
    #   visit new_info_path
    #   expect(page).to be(new_user_session_path)
    #   info = FactoryGirl.create!(:info)
    #   visit blog_path(info)
    #   expect(page).to
    #   visit edit_info_path(info)
    #   expect
    # end

  end
end

