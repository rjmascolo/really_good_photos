class UsersphotosController < ApplicationController
  def new
    #code
  end

  def index
    #code
  end

  def show
    byebug
    @user = current_user
  end
end
