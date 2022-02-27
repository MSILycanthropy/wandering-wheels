# Base controller for all stuff that requires
# authentication.
class AuthenticatedBaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facility

  private

  def set_facility
    @facility = current_user.facility
  end
end
