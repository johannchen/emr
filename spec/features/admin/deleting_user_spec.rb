require 'spec_helper'

describe "Deleting an user" do
	let(:admin) { create(:admin) }

	before :each do
		@user = create(:user)
		visit '/users/sign_in'
		fill_in 'user_email', :with => admin.email
		fill_in 'user_password', :with => admin.password
		click_button 'Sign in'
    visit '/admin/users'
	end

	it "deletes an user" do
		click_link @user.email
		click_link 'Delete'
		expect(page).to have_content 'User has been deleted'
	end

	it "cannot delete themselves" do
		click_link admin.email
		click_link 'Delete'
		expect(page).to have_content 'You cannot delete yourself!'
	end
end
