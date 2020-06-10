require 'rails_helper'

describe "the signin process", type: :feature do

  it "signs a user in" do
    user = User.create!(email: "test@test.com", password: "password", password_confirmation: "password") 

    visit products_path
    click_link 'Sign In'
    fill_in "user_email", :with => 'test@test.com'
    fill_in "user_password", :with => 'password'
    click_button "Log in"
    expect(page).to have_content 'Signed in successfully.'
  end
end

