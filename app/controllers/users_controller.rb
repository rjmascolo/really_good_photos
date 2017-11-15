class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are logged in!"
      redirect_to photos_path
    else
      flash[:notice] = "Not a valid user! Please log in."
      render :new
    end
  end

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(session[:user_id])
    @photos = @user.get
  end

  def delete(user_id, photo_id)
    user = User.find(user_id)
    photo = @user.photos.find(photo_id)
    user.photos.destroy(user.id, photo.photo_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :home_location)
  end

end
