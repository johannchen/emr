require 'spec_helper'

feature "Patient" do
  let(:user) { create(:user) }

  before :each do
    sign_in(user)
    @patient = create(:patient)
  end

  scenario "search patient by name" do
    fill_in "Patient", with: @patient.first_name
    click_button "Search"
    expect(page).to have_content @patient.full_name
  end

  scenario "search patients by department" do
  end
end

