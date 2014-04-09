class HistoryTrackersController < ApplicationController
  before_filter :authenticate_user!
  def index
		Model = params[:model].camelize.constantize
		@model = Model.find(params[:id])
		@tracks = @model.history_tracks.first
  end

  def show
  end

end
