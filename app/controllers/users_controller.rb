class UsersController < AuthenticatedBaseController
  before_action :set_user, only: %i[show edit update destroy]

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Successfully updated!'
      render_flash
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'users/modal_form', locals: { user: @user })
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 avatar_attributes: %i[id url _destroy])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
