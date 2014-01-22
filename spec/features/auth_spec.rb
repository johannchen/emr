require 'spec_helper'

feature "Authentication" do
	let(:user) { create(:user) }

	scenario "signs in succesfully" do
    sign_in(user)
		expect(page).to have_link('Log out')
		expect(page).to have_link(user.full_name)
		page.should_not have_link('Admin')
	end
end
