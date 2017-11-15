class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      redirect_to photos_path
    else
      flash.now[:notice] = "Oops! It looks like the email and/or password you entered is incorrect. Please try again!"
      @user = User.new

      render 'static/index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
