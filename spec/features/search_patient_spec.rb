require 'spec_helper'

describe "Patient Search" do
  let(:user) { create(:user) }

  before :each do
    sign_in(user)
  end

  it "search patient by name" do
  end
end

