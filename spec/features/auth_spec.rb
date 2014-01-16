require 'spec_helper'

describe "Authentication" do
	let(:user) { create(:user) }

	before :each do
		visit '/users/sign_in'
	end

	it "signs in succesfully" do
		fill_in 'user_email', :with => user.email
		fill_in 'user_password', :with => user.password
		click_button 'Sign in'
		expect(page).to have_link('Log out')
		expect(page).to have_link(user.full_name)
		page.should_not have_link('Admin')
	end
end
