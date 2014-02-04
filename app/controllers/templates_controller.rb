class TemplatesController < ApplicationController
  before_filter :authenticate_user!

  def patient 
  end

  def template
    render :template => 'templates/' + params[:path], :layout => nil
  end
end
