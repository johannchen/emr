class BehaviorsController < ApplicationController
  before_filter :authenticate_user!
	def index
		@behaviors = patient.behaviors
		render json: @behaviors
	end

  def show
		behavior
		render json: @behavior	
  end

  def create
    params[:behavior][:editor] = current_user.full_name
    if current_user.doctor? 
      @behavior = patient.behaviors.create!(safe_params)
      render json: @behavior
    else
      render nothing: true
    end
  end

  def update
    behavior
    # only creator can update his own record
    # todo: use id to check to enhance accuracy
    if @behavior.editor == current_user.full_name or current_user.admin
      #params[:behavior][:editor] = current_user.full_name
      @behavior.update_attributes(safe_params)
    end
    render nothing: true
  end

  def destroy
    behavior.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def behavior
    @behavior ||= patient.behaviors.find(params[:id])
  end

  def safe_params
    params.require(:behavior).permit(:name, :details, :editor)
  end
end
