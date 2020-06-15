require 'rails_helper'

describe 'CRUD for products as an admin', type: :feature do
  before :each do
    user = User.create!(email: "test1@test.com", password: "password", password_confirmation: "password", admin: true) 
    visit products_path
    click_link 'Sign In'
    fill_in "user_email", :with => 'test1@test.com'
    fill_in "user_password", :with => 'password'
    click_button "Log in"
  end
  it "adds a new product to the list of products" do
    click_link 'see our products'
    click_link 'Create a new product'
    fill_in 'product_name', :with => "Test Product"
    fill_in "product_cost", :with => "100"
    fill_in "product_country_of_orgin", :with => 'USA'
    click_button "Create Product"
    expect(page).to have_link 'Test Product'
  end

  it "edits a product from the list of products" do
    click_link 'see our products'
    click_link 'Create a new product'
    fill_in 'product_name', :with => "Test Product"
    fill_in "product_cost", :with => "100"
    fill_in "product_country_of_orgin", :with => 'USA'
    click_button "Create Product"
    click_link 'Test Product'
    click_link 'Edit'
    fill_in 'product_name', :with => "Edited Product"
    click_button 'Update Product'
    expect(page).to have_content 'Edited Product'
  end

  it "deletes a product from the list of prducts" do
    click_link 'see our products'
    click_link 'Create a new product'
    fill_in 'product_name', :with => "Test Product"
    fill_in "product_cost", :with => "100"
    fill_in "product_country_of_orgin", :with => 'USA'
    click_button "Create Product"
    click_link 'Test Product'
    click_link 'Delete'
    expect(page).to have_content "Test Product has been destroyed."
  end
end