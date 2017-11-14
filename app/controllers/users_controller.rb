class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      flash[:notice] = "You are logged in!"
      redirect_to :show
    else
      flash[:notice] = "Not a valid user! Please log in."
      redirect_to :new
    end
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.get_photos
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :home_location)
  end

end
