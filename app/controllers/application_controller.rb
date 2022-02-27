class ApplicationController < ActionController::Base
  def render_flash
    render turbo_stream: turbo_stream.replace('flash', partial: 'shared/flash')
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, notice: 'You must sign in to access this page.'
    end
  end
end
