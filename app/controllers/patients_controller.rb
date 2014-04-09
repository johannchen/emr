class PatientsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.create!(safe_params, modifier: current_user)
    render json: @patient 
  end

  def update
    @patient = Patient.find(params[:id])
		@patient.modifier = current_user
    @patient.update_attributes(safe_params)
    render nothing: true
  end

  def delete
  end

  private
  def safe_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :birthday, :email, :phone)
  end
end
