class PhotosController < ApplicationController

  def index
    # byebug
    @user = User.find_by(id: session[:user_id])
    @photos = @user.get_photo_info
  end

  private

  def set_page
    @page = params[:page] || 0
  end
end
