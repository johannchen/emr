class DiagnosisNamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @diagnosis_names = DiagnosisName.asc(:name) 
  end

  def show
    diagnosis_name
  end

  def create
    @diagnosis_name = DiagnosisName.create!(safe_params)
    render json: @diagnosis_name
  end

  def update
    diagnosis_name.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    diagnosis_name.destroy
    render nothing: true
  end

  private
  def diagnosis_name
    @diagnosis_name ||= DiagnosisName.find(params[:id])
  end

  def safe_params
    params.require(:diagnosis_name).permit(:name)
  end
end
