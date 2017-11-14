class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
<<<<<<< HEAD
=======

>>>>>>> 3ebcad5a6d58a5a8a8f2397edf0ae01601f6df7d
    if @user.save
      session[:user_id] = @user_id
      flash[:notice] = "You are logged in!"
      redirect_to photos_path
    else
      flash[:notice] = "Not a valid user! Please log in."
      render :new
    end
  end

  def index
    @user = User.find(session[:user_id])
    @photos = @user.photos
  end

  def show
    @user = User.find(session[:user_id])
<<<<<<< HEAD
    @photos = @user.get_photos
=======
>>>>>>> 3ebcad5a6d58a5a8a8f2397edf0ae01601f6df7d
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :home_location)
  end

end
