class PhotosController < ApplicationController

  def index
    # byebug
    @user = User.find_by(id: session[:user_id])
    @photos = @user.get_photo_info
  end


end
