class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
    else
      redirect_to users_new_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
