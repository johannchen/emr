require 'spec_helper'

describe "Editing an user" do
	let(:admin) { create(:admin) }
	#let(:user) { create(:user) }

	before :each do
		@user = create(:user)
		visit '/users/sign_in'
		fill_in 'Email', :with => admin.email
		fill_in 'Password', :with => admin.password
		click_button 'Sign in'
		click_link 'Admin'
		click_link 'Users'
		click_link @user.email
		click_link 'Edit User'
	end

	it "updates an user's details" do
		fill_in 'Email', :with => "update@example.com"
		click_button 'Update User'
		expect(page).to have_content 'User has been updated.'
		expect(page).to have_content 'update@example.com'
		page.should_not have_content @user.email
	end

	it "sets user as an admin" do
		check 'Admin'
		click_button 'Update User'
		expect(page).to have_content 'User has been updated.'
		expect(page).to have_content "#{@user.email} (Admin)"
	end

	it "cannot update with an invalid email" do
		fill_in 'Email', :with => 'fake'
		click_button 'Update User'
		expect(page).to have_content 'User has not been updated.'
		expect(page).to have_content 'Email is invalid'
	end

end