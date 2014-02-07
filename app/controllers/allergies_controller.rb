class AllergiesController < ApplicationController
  before_filter :authenticate_user!
  def show
    allergy
  end

  def create
  end

  def update
    allergy.update_attributes(safe_params)
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def allergy
    @allergy ||= patient.allergies.find(params[:id])
  end

  def safe_params
    params.require(:allergy).permit(:name)
  end
end
