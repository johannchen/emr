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
    @medications = @patient.medications.in(stop: [nil, false])
    @last_visit = @patient.visits.desc(:visit_date).first
    if @last_visit
      @vital_sign = @last_visit.vital_sign 
      @recent_visits = @patient.visits.desc(:visit_date).limit(5)
    end
  end

  def create
    params[:patient][:editor] = current_user.full_name
    params[:patient][:address] = params[:address]
    @patient = Patient.create!(safe_params)
    render json: @patient 
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.editor == current_user.full_name or current_user.admin
      # params[:patient][:editor] = current_user.full_name unless @patient.editor
      @patient.update_attributes(safe_params)
    end
    render nothing: true
  end

  def delete
  end

  private
  def safe_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :birthday, :email, :phone, :nationality, :occupation, :company, :editor, address: [:province, :city, :district, :street])
  end
end
