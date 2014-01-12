require 'spec_helper'

describe "Creating Users" do
	let(:admin) { create(:admin) }

	before :each do
		visit '/users/sign_in'
		fill_in 'Email', :with => admin.email
		fill_in 'Password', :with => admin.password
		click_button 'Sign in'
		click_link 'Admin'
		click_link 'Users'
		click_link 'New User'
	end

  it "creates a new user" do
    fill_in 'Email', :with => 'newbie@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Create User'
    expect(page).to have_content 'User has been created.'
  end

  it "results in an error when leaving email blank" do
  	fill_in 'Email', :with => ''
  	fill_in 'Password', :with => 'password'
    click_button 'Create User'
  	expect(page).to have_content "Email can't be blank"
  end

  it "creates an admin user" do
    fill_in 'Email', :with => 'newadmin@example.com'
    fill_in 'Password', :with => 'password'
    check 'Admin'
    click_button 'Create User'
    expect(page).to have_content 'User has been created.'
    expect(page).to have_content 'newadmin@example.com (Admin)'
  end
end
