class SurgeryNamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @surgeries = SurgeryName.asc(:name) 
  end

  def show
    surgery
  end

  def create
    @surgery = SurgeryName.create!(safe_params)
    render json: @surgery
  end

  def update
    surgery.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    surgery.destroy
    render nothing: true
  end

  private
  def surgery
    @surgery ||= SurgeryName.find(params[:id])
  end

  def safe_params
    params.require(:surgery_name).permit(:name)
  end
end
