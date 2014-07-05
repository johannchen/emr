class SurgeriesController < ApplicationController
  before_filter :authenticate_user!
	def index
		@surgeries = patient.surgeries
		render json: @surgeries
	end

  def show
		surgery
		render json: @surgery	
  end

  def create
    params[:surgery][:editor] = current_user.full_name
    if current_user.doctor 
      @surgery = patient.surgeries.create!(safe_params)
      render json: @surgery
    else
      render nothing: true
    end
  end

  def update
    surgery
    if @surgery.editor == current_user.full_name or current_user.admin
      @surgery.update_attributes(safe_params)
    end
    render nothing: true
  end

  def destroy
    surgery.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def surgery
    @surgery ||= patient.surgeries.find(params[:id])
  end

  def safe_params
    params.require(:surgery).permit(:name, :year, :details, :editor)
  end
end
