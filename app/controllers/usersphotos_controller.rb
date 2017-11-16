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

end
