require 'spec_helper'

feature "Patient" do
  let(:user) { create(:user) }

  before :each do
    sign_in(user)
    @patient = create(:patient)
  end

  scenario "creates new paitent" do
    click_link "New Patient"
    fill_in "First name", with: "Katie"
    fill_in "Last name", with: "Chen"
    click_button "Create Patient"
    expect(page).to have_content "Katie Chen"
  end
  
  scenario "search patient by name" do
    fill_in "Patient", with: @patient.first_name
    click_button "Search"
    expect(page).to have_content @patient.full_name
  end
end

