class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @blogs = user.blogs.page(params[:page]).per(6).order("created_at DESC")
  end
end
