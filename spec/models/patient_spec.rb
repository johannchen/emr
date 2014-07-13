require 'spec_helper'

describe Patient do

  describe "#search" do
    let(:john) { create(:patient, first_name: 'John', last_name: 'Chen') }
    let(:jay) { create(:patient, first_name: 'Jay', last_name: 'Chen') }
    let(:mary) { create(:patient, first_name: 'Mary', last_name: 'Wong') }

    context "matching letters" do
      it "returns a sorted array of matched results" do 
        expect(Patient.search("J")).to eq [jay, john]
      end
    end

  end
end
