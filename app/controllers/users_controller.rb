class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      flash[:notice] = "You are logged in!"
      render :show
    else
      flash[:notice] = "Not a valid user! Please log in."
      render :new
    end
  end

  def index
    byebug
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :home_location)
  end

end
