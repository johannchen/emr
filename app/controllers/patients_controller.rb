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
    @last_visit = @patient.visits.desc(:visit_date).first
    @vital_sign = @last_visit.vital_sign if @last_visit
  end

  def create
    params[:patient][:editor] = current_user.full_name
    @patient = Patient.create!(safe_params)
    render json: @patient 
  end

  def update
    @patient = Patient.find(params[:id])
		#@patient.modifier = current_user
    params[:patient][:editor] = current_user.full_name
    @patient.update_attributes(safe_params)
    render nothing: true
  end

  def delete
  end

  private
  def safe_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :birthday, :email, :phone, :nationality, :occupation, :company, :editor, address: [:province, :city, :district, :street])
  end
end
