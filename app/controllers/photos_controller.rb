class PhotosController < ApplicationController

  def index
    @user = User.find_by(session[:id])
    @photos = @user.create_photos
  end

end
