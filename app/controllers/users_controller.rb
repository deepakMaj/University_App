class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome admin, you have successfully logged in"
      redirect_to root_path
    else
      flash[:danger] = "Invalid Credentials"
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

end
