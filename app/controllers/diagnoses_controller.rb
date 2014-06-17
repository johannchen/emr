class DiagnosesController < ApplicationController
  before_filter :authenticate_user!
	def index
		@diagnoses = patient.diagnoses
		render json: @diagnoses
	end

  def show
		diagnosis
		render json: @diagnosis	
  end

  def create
    params[:diagnosis][:editor] = current_user.full_name
    @diagnosis = patient.diagnoses.create!(safe_params)
    render json: @diagnosis
  end

  def update
    diagnosis
    if @diagnosis.editor == current_user.full_name or current_user.admin
      diagnosis.update_attributes(safe_params)
    end
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
    params.require(:diagnosis).permit(:name, :year, :details, :editor)
  end
end
