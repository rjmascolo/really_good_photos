class PhotosController < ApplicationController

  def index
    @user = User.find_by(session[:id])
    @photos = @user.get_photos
  end
  
end
