class VisitsController < ApplicationController
  before_filter :authenticate_user!
	def index
		@visits = patient.visits
		render json: @visits
	end

  def show
		visit
		render json: @visit	
  end

  def create
    params[:visit][:editor] = current_user.full_name
    @visit = patient.visits.create!(safe_params)
    render json: @visit
  end

  def update
    visit
    # only creator can update his own record
    # todo: use id to check to enhance accuracy
    if @visit.editor == current_user.full_name
      params[:visit][:editor] = current_user.full_name
      visit.update_attributes(safe_params)
      render nothing: true
    end
  end

  def destroy
    visit.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def visit
    @visit ||= patient.visits.find(params[:id])
  end

  def safe_params
    params.require(:visit).permit(:visit_date, :subjective, :physical, :assessment, :lab, :plan, :follow_up, :editor, :vital_sign_attributes)
  end
end
