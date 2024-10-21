class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  
      redirect_to root_path, notice: 'User has logged in succes'
    else
      flash.now[:alert] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'User has not logged in'
  end
end
