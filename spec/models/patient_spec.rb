require 'spec_helper'

describe Patient do

  describe ".search" do
    let(:john) { create(:patient, first_name: 'John', last_name: 'Chen', birthday: '2001-07-04', phone: '123456789') }
    let(:jay) { create(:patient, first_name: 'Jay', last_name: 'Chen', birthday: '2014-06-03') }
    let(:mary) { create(:patient, first_name: 'Mary', last_name: 'Wong', birthday: '2001-05-02', phone: '987654321') }

    context "matching letters" do
      it "returns a sorted array of results that matched first name" do 
        expect(Patient.search("J")).to eq [jay, john]
      end
      it "returns a sorted array of results that matched last name" do 
        expect(Patient.search("W")).to eq [mary]
      end
      it "returns a sorted array of results that matched phone" do 
        expect(Patient.search("123456")).to eq [john]
      end
      #it "returns a sorted array of results that matched birthday" do 
      #  expect(Patient.search("2001")).to eq [john, mary]
      #end
    end

    context "input empty string" do
      it "returns nothing" do
        expect(Patient.search("")).to be_nil 
      end
    end

  end
end
