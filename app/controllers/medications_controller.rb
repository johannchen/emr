class MedicationsController < ApplicationController
  before_filter :authenticate_user!
	def index
		@medications = patient.medications
		render json: @medications
	end

  def show
		medication
		render json: @medication	
  end

  def create
    params[:medication][:editor] = current_user.full_name
    @medication = patient.medications.create!(safe_params)
    render json: @medication
  end

  def update
    medication
    # only creator can update his own record
    # todo: use id to check to enhance accuracy
    if @medication.editor == current_user.full_name
      params[:medication][:editor] = current_user.full_name
      medication.update_attributes(safe_params)
      render nothing: true
    end
  end

  def destroy
    medication.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def medication
    @medication ||= patient.medications.find(params[:id])
  end

  def safe_params
    params.require(:medication).permit(:name, :script, :details, :editor)
  end
end
