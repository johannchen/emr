require "spec_helper"

describe "/api/v1/users", :type => :api do
	context "for an admin" do
		let(:admin) { create(:admin)}
		let(:url) { "/api/v1/users" }
		# before { sign_in(admin) }

		describe "#index" do
			context "for a list of users" do
				##
				#let(:user1) { create(:user) }
#				let(:user2) { create(:user) }
#				it "should return json of users" do
#					get "#{url}"
#					users = JSON.parse(response.body)
#					users.should == [
#						{'id' => user1.id, 'email' => user1.email},
#						{'id' => user2.id, 'email' => user2.email}							
#					]
#				end
			end
		end

	end
end