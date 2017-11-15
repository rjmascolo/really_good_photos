class PhotosController < ApplicationController

  def index
    # byebug
    @user = User.find_by(id: session[:user_id])
    @photos = @user.get_photo_info
  end

  def show
    # @user = User.find_by(id: session[:user_id])
    @photo = Photo.find(params[:id])
    #code
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :longitude, :latitude, :taken_at, :category_id, :location, :rating, :image_url)
  end

  def set_page
    @page = params[:page] || 0
  end
end
