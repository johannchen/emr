class MedNamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @meds = MedName.asc(:name) 
    #render json: @meds, only: [:_id, :name]
  end

  def show
    med
    #render json: @med
  end

  def create
    @med = MedName.create!(safe_params)
    render json: @med
  end

  def update
    med.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    med.destroy
    render nothing: true
  end

  private
  def med
    @med ||= MedName.find(params[:id])
  end

  def safe_params
    params.require(:med_name).permit(:name)
  end
end
