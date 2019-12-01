class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :blog_params, only: [:create, :update]
  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(6).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title], text: blog_params[:text], image: blog_params[:image], user_id: current_user.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
    @comment = Comment.new
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
