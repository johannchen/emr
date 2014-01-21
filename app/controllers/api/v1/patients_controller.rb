class Api::V1::PatientsController < Api::V1::BaseController
	def index
		respond_with(Patient.all)
	end

  def create
    patient = Patient.create!(safe_params)
    respond_with(patient)
  end

  private
  def safe_params
    params.require(:patient).permit(:first_name, :last_name)
  end
end

