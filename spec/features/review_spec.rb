require 'rails_helper'

describe 'It will let a user add reviews' do
  before :each do
    not_admin = User.create!(email: "test1@test.com", password: "password", password_confirmation: "password") 
    product = Product.create!(name: "test product", cost: "5", country_of_orgin: "USA")
    user = User.create!(email: "test2@test.com", password: "password", password_confirmation: "password", admin: true) 
    visit products_path
    click_link 'Sign In'
    fill_in "user_email", :with => 'test1@test.com'
    fill_in "user_password", :with => 'password'
    click_button "Log in"
    click_link 'see our products'
    click_link 'Test Product'
    click_link 'Add Review'
  end
  it "lets an admin delete a review" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[content_body]", :with => "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    fill_in "review[rating]", :with => "5"
    click_button "Submit!"
    click_link 'Logout'
    click_link 'Sign In'
    fill_in "user_email", :with => 'test2@test.com'
    fill_in "user_password", :with => 'password'
    click_button "Log in"
    click_link "see our products"
    click_link "Test Product"
    click_link "edit review"
    fill_in "review[author]", :with => 'ME'
    click_button "Edit"
    expect(page).to have_content "ME"
  end
  it "adds a review to a product as a non admin user" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[content_body]", :with => "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    fill_in "review[rating]", :with => "5"
    click_button "Submit!"
    expect(page).to have_content "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
  end

  it "prevents a user from not filling in an author name" do
    fill_in "review[content_body]", :with => "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    fill_in "review[rating]", :with => "5"
    click_button "Submit!"
    expect(page).to have_content "Author can't be blank"
  end
  it "prevents a user from not filling in content_body" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[rating]", :with => "5"
    click_button "Submit!"
    expect(page).to have_content "Content body can't be blank"
  end

  it "prevents a user from not filling in content_body with enough characters" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[rating]", :with => "5"
    fill_in "review[content_body]", :with => "This is a sentence with not enough charaters 49.."
    click_button "Submit!"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
  end

  it "prevents a user from not filling in a rating" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[content_body]", :with => "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    click_button "Submit!"
    expect(page).to have_content "Rating can't be blank"
  end

  it "prevents a user from entering a number less then 1 in rating" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[content_body]", :with => "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    fill_in "review[rating]", :with => "0"
    click_button "Submit!"
    expect(page).to have_content "Rating must be greater than or equal to 1"
  end

  it "prevents a user from entering a number more then 5 rating" do
    fill_in "review[author]", :with => "test author"
    fill_in "review[content_body]", :with => "blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    fill_in "review[rating]", :with => "6"
    click_button "Submit!"
    expect(page).to have_content "Rating must be less than or equal to 5"
  end

 
end