require 'rails_helper'

describe "the sign up process ", type: :feature do

  it "signs a user up" do
    visit products_path
    click_link 'Sign Up'
    fill_in "user_email", :with => 'test@test.com'
    fill_in "user_password", :with => 'password'
    fill_in "user_password_confirmation", :with => 'password'
    click_button "Sign up"
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

  