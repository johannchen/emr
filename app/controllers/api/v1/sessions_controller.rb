class Api::V1::SessionsController < Devise::SessionsController
  before_action :warden_authenticate

  def create
  end

  def destroy
  end

  private
  def warden_authenticate
    self.resource = warden.authenticate!(auth_options)
  end
end
