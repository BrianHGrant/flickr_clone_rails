require 'rails_helper'

describe "the login a user process" do
  it "adds a new user" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_link 'Sign In'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "gives error when no email is entered" do
    visit "/"
    click_link 'Sign In'
    click_on 'Log in'
    expect(page).to have_content "Invalid Email or password."
  end
end
