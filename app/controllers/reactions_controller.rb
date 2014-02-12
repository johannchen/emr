class ReactionsController < ApplicationController
  before_filter :authenticate_user!
  def show
    reaction
  end

  def create
    @reaction = patient.reactions.create!(safe_params)
    render json: @reaction
  end

  def update
    reaction.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    reaction.destroy
    render nothing: true
  end

  private
  def patient
    @patient ||= Patient.find(params[:patient_id])
  end

  def reaction
    @reaction ||= patient.reactions.find(params[:id])
  end

  def safe_params
    params.require(:reaction).permit(:medication, :name)
  end
end
