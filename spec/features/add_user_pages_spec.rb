require 'rails_helper'

describe "the sign in process" do
  it "creates a new account" do
    visit new_user_path
    fill_in 'Email', :with => 'test@eamil.com'
    fill_in 'Password', :with => 'test1'
    fill_in 'Password confirmation', :with => 'test1'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome'
  end
  it "logs in with new account" do
    visit new_user_path
    fill_in 'Email', :with => 'test@eamil.com'
    fill_in 'Password', :with => 'test1'
    fill_in 'Password confirmation', :with => 'test1'
    click_on 'Sign Up'
    visit log_in_path
    fill_in 'Email', :with => 'test@eamil.com'
    fill_in 'Password', :with => "test1"
    click_on 'Log in'
    expect(page).to have_content 'test@eamil.com'
  end
end
