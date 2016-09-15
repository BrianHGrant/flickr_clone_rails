require 'rails_helper'
require 'launchy'

describe "the show images tagged to user" do
  it "will show images with user tagged on user profile" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, :email => "new@email.com")
    visit "/"
    click_link 'Sign In'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    click_link 'Create'
    attach_file "Image", "public/images/thumb/missing.jpeg"
    fill_in 'Description', :with => 'avatar'
    click_on "Create Image"
    click_on "image Page"
    click_on "Person"
    select('new@email.com')
    click_on "Create Tag"
    click_on "Logout"
    click_link 'Sign In'
    fill_in 'Email', :with => 'new@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    click_on 'Profile'
    expect(page).to have_content('avatar')
  end

end
