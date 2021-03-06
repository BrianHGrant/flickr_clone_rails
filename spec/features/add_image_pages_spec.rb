require 'rails_helper'

describe "the add an image path" do
  it "will allow an authenticated user to add image" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_link 'Sign In'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    click_link 'Create'
    attach_file "Image", "public/images/thumb/missing.jpeg"
    fill_in 'Description', :with => 'avatar'
    click_on "Create Image"
    expect(page).to have_content("avatar image Page(editable by you)")
  end

  it "gives error when no image is attached" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_link 'Sign In'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    click_link 'Create'
    click_on "Create Image"
    expect(page).to have_content("Image failed to save")
  end
end
