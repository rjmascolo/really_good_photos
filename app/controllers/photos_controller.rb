class PhotosController < ApplicationController

  def index
    User.logged_in?(session)
      @user = User.find_by(id: session[:user_id])
      if params[:category] && !params[:category][:location].blank?
        # takes in params returns lat and long and then retrives photos around the radius
        @photos = Photo.search_location_cooridinates(params, @user)
        params[:category][:category_filter] ? @photos = Photo.return_photos_based_on_category(params, @photos) : nil
        @category_name_array = @photos.map{|photo| photo.category.name}.uniq
      else
        @photos = @user.get_photos(@user.longitude,@user.latitude, "1km")
          if params[:category]
            @photos = Photo.return_photos_based_on_category(params, @photos)
            @filtered = true
          end
        @category_name_array = @photos.map{|photo| photo.category.name}.uniq
      end
  end

  def show
    User.logged_in?(session)
    @user = User.find_by(id: session[:user_id])
    @photo = Photo.find(params[:id])
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :longitude, :latitude, :taken_at, :category_id, :location, :rating, :image_url)
  end

  def set_page
    @page = params[:page] || 0
  end
end
