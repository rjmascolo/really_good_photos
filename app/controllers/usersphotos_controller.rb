class UsersphotosController < ApplicationController
  def new
    #code
  end

  def index
    #code
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
    @user_photo = Usersphoto.create(user_id: @user.id, photo_id: @photo.photo_id)
    byebug
  end
end
