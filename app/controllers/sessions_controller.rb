class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(session_params[:name])
    return head(:forbidden) unless @user.authenticate(session_params[:password])
    session[:user_id] = @user.id
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
