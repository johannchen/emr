class ProfilesController < ApplicationController
	before_filter :authenticate_user!
	def show 
    @user = User.find(params[:id])
	end

	def edit
    @user = User.find(params[:id])
	end

	def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user == current_user
      if @user.update_attributes(safe_params)
        flash[:notice] = "Profile has been updated."
        redirect_to profile_path(@user)
      else
        flash[:alert] = "Failed to update profile."
        render :edit
      end
    end
	end

  private
  def safe_params
    params.require(:user).permit(:email, :phone, :password)
  end
end
