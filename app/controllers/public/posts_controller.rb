class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:post_name, :post_text, :image)
  end
end
