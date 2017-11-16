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
    @user.photos << @photo
    redirect_to users_url
  end

  def destroy
    @user = current_user
    @photo = Photo.find(params[:id])
    userphoto = Usersphoto.find_by(user_id: @user.id, photo_id: @photo.id)
    userphoto.destroy
    redirect_to users_url
  end


end
