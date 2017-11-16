class PhotosController < ApplicationController
  
  def index
    if !session[:user_id]
      redirect_to root_path
    else
      @user = User.find_by(id: session[:user_id])
      if params[:q]
        location = Geocoder.search(params[:q])
        coordinates = location[0].data["geometry"]["location"]
        @photos = @user.get_photos(coordinates["lng"], coordinates["lat"])
      else
        @photos = @user.get_photos(@user.longitude,@user.latitude)
      end
    end
  end

  def show
    if !session[:user_id]
      redirect_to root_path
    else
      @user = User.find_by(id: session[:user_id])
      @photo = Photo.find(params[:id])
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :longitude, :latitude, :taken_at, :category_id, :location, :rating, :image_url)
  end

  def set_page
    @page = params[:page] || 0
  end
end
