class DiagnosesController < ApplicationController
  before_filter :authenticate_user!
	def index
		@diagnoses = patient.diagnoses.in(deleted: [nil, false])
		render json: @diagnoses
	end

  def show
		diagnosis
		render json: @diagnosis	
  end

  def create
    @diagnosis = patient.diagnoses.create!(safe_params)
    render json: @diagnosis
  end

  def update
    diagnosis.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    diagnosis.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def diagnosis
    @diagnosis ||= patient.diagnoses.find(params[:id])
  end

  def safe_params
    params.require(:diagnosis).permit(:name, :year, :comment, :deleted, :edited_by)
  end
end
