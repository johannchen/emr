require 'spec_helper'

describe Admin::UsersController do
	let(:user) { create(:user) }
	let(:user1) { create(:user) }

	context "standard users" do
		before do 
			sign_in(user)
		end

		it "cannot access the index action" do
			get :index
			response.should redirect_to(root_path)
			flash[:alert].should eql("You must be an admin to do that.")
		end

#		{ "index" => "get",
#			"create" => "post",
#			"edit" => "get",
#			"update" => "put",
#			"destroy" => "delete"
#		}.each do |action, method|
#			it "cannot access the #{action} action" do
#				sign_in(user)
#				send(method, action.dup, :id => user1.id)
#				response.should redirect_to(root_path)
#				flash[:alert].should eql("You must be an admin to do that.")
#			end
#		end
	end

end
