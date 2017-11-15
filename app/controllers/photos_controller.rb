class PhotosController < ApplicationController

  def index
    if !session[:user_id]
      redirect_to root_path
    else
      @user = User.find_by(id: session[:user_id])
      @photos = @user.get_photo_info
    end
  end

  def show
    if !session[:user_id]
      redirect_to root_path
    else
    # @user = User.find_by(id: session[:user_id])
      @photo = Photo.find(params[:id])
    end
    #code
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :longitude, :latitude, :taken_at, :category_id, :location, :rating, :image_url)
  end

end
