class StaticController < ApplicationController

  def index
    if session[:user_id]
      redirect_to '/users'
    else
      @user = User.new
    end
  end

end
