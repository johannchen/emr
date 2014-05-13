class FamilyMembersController < ApplicationController
  before_filter :authenticate_user!
	def index
		@family_members = patient.family_members
		render json: @family_members
	end

  def show
		family_member
		render json: @family_member	
  end

  def create
    params[:family_member][:editor] = current_user.full_name
    @family_member = patient.family_members.create!(safe_params)
    render json: @family_member
  end

  def update
    unless params[:family_member][:patient_id] == ""
      p = Patient.find(params[:family_member][:patient_id])
      params[:family_member][:name] = p.full_name
    end
    family_member
    if @family_member.editor == current_user.full_name or current_user.admin
      @family_member.update_attributes(safe_params)
    end
    render nothing: true
  end

  def destroy
    family_member.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def family_member
    @family_member ||= patient.family_members.find(params[:id])
  end

  def safe_params
    params.require(:family_member).permit(:relation, :description, :patient_id, :name, :editor)
  end
end
