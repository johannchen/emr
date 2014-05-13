class VisitsController < ApplicationController
  before_filter :authenticate_user!
	def index
		@visits = patient.visits.desc(:visit_date)
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
    if @visit.editor == current_user.full_name or current_user.admin
      @visit.update_attributes(safe_params)
    end
    render nothing: true
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
    params.require(:visit).permit(:visit_date, :subjective, :physical, :assessment, :lab, :treatment, :follow_up, :editor, vital_sign: [:blood_pressure, :pulse, :respiratory_rate, :temperature, :height, :weight, :pediatric_hc, :oxygen_saturation, :bmi], physical: [:general, :heent, :neck, :respiratory, :cardiac, :abdomen, :gu, :rectal, :extremities, :back, :skin, :breast, :neuro, :psych])
  end
end
