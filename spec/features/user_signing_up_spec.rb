require 'spec_helper'

feature 'viewer signing up', %q{
  As an unregistered user,
  I can sign up for the website
  So I can be happy and stop trolling good people} do

# AC:
# I must enter a previously unregistered email
# I must enter the same password in the confirmation field

  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  context 'filling out user information' do

    it 'allows you to sign up when you give valid entries' do
      visit new_user_registration_path
      user = ('a'..'z').to_a.shuffle.pop(20).join
      fill_in "Email", with: "#{user}@shlomo.com"
      fill_in "Password", with: "adminqwerty"
      fill_in "Password confirmation", with: "adminqwerty"
      within "#new_user" do
        click_on "Sign up"
      end

      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(page).to have_content('Sign Out')
    end


    it "gives you an error message when you don't give it an email" do
      visit new_user_registration_path
      fill_in "Email", with: ""
      fill_in "Password", with: "adminqwerty"
      fill_in "Password confirmation", with: "adminqwerty"
      within "#new_user" do
        click_on "Sign up"
      end

      expect(page).to have_content("Email can't be blank")
    end

    it "gives you an error message when you don't give it an password" do
      visit new_user_registration_path
      user = ('a'..'z').to_a.shuffle.pop(20).join
      fill_in "Email", with: "#{user}@shlomo.com"
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: ""
      within "#new_user" do
        click_on "Sign up"
      end

      expect(page).to have_content("Password can't be blank")
    end

    it "gives you an error when you enter in email that was already registered" do
        User.create!(email: 'user@shlomo.com', password: 'adminqwerty')
        visit new_user_registration_path
        fill_in "Email", with: "user@shlomo.com"
        fill_in "Password", with: "adminqwerty"
        fill_in "Password confirmation", with: "adminqwerty"
        within "#new_user" do
          click_on "Sign up"
        end

      expect(page).to have_content("Email has already been taken")
    end

  end

  context 'redirecting' do

    it 'takes you to the sign up page when you give invalid info' do
      visit new_user_registration_path
      user = ('a'..'z').to_a.shuffle.pop(20).join
      fill_in "Email", with: "#{user}@shlomo.com"
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: ""
      within "#new_user" do
        click_on "Sign up"
      end

      within "#new_user" do
        expect(page).to have_button("Sign up")
      end
    end

  end

end
