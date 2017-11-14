class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :show
    else
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
