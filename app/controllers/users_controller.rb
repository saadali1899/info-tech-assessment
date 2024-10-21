class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created'
    else
      render :new
    end
  end


  private
    def users_params
      params.require(:user).permit(:email, :password_confirmation, :password)
    end
end
