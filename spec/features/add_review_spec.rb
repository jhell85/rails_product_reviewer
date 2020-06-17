require 'rails_helper'

describe 'It will let a user add reviews' do
  before :each do
    user = User.create!(email: "test1@test.com", password: "password", password_confirmation: "password", admin: true) 
    visit products_path
    click_link 'Sign In'
    fill_in "user_email", :with => 'test1@test.com'
    fill_in "user_password", :with => 'password'
    click_button "Log in"
    product = Product.create!(name: "test product", cost: "5", country_of_orgin: "USA")
  end

  it "adds a review to a product as a non admin user" do
    click_link 'see our products'
    click_link 'Create a new product'
    fill_in 'product_name', :with => "Test Product"
    fill_in "product_cost", :with => "100"
    fill_in "product_country_of_orgin", :with => 'USA'
    click_button "Create Product"
    expect(page).to have_link 'Test Product'
  end
end