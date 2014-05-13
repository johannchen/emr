class AllergiesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @allergies = patient.allergies
    render json: @allergies
  end

  def show
    allergy
    render json: @allergy
  end

  def create
    params[:allergy][:editor] = current_user.full_name
    @allergy = patient.allergies.create!(safe_params)
    render json: @allergy
  end

  def update
    allergy
    if @allergy.editor == current_user.full_name or current_user.admin
      #params[:allergy][:editor] = current_user.full_name
      @allergy.update_attributes(safe_params)
    end
    render nothing: true
  end

  def destroy
    allergy.destroy
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
    params.require(:allergy).permit(:name, :reaction, :details, :editor)
  end
end
