require 'rails_helper'

describe "the edit an image path" do
  it "will allow user to edit an image" do
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
    all('a').last.click
    click_on "Edit"
    fill_in 'Description', :with => 'person'
    click_on "Update Image"
    expect(page).to have_content('Image updated')
  end

  it "will display error if edit image form is incomplete" do
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
    all('a').last.click
    click_on "Edit"
    fill_in 'Description', :with => ''
    click_on "Update Image"
    expect(page).to have_content('Image update failed')
  end
end
