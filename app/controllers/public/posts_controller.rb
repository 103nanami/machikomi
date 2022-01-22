class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def new
    @post = Post.new
    @cities = City.all
  end

  def create

    post = Post.new(post_params)
    post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @post_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update
    redirect_to posts_path
  end

  def spot
    #@posts = Post.all
    @posts = Post.where(params[:lat]).where(params[:lng])
  end

  private
  def post_params
<<<<<<< HEAD
    params.require(:post).permit(:post_name, :post_text, :image, :city_id, :user_id, :lat, :lng)
=======
    params.require(:post).permit(:post_name, :post_text, :image, :city_id, :user_id)
>>>>>>> f9b25d0e1a77d6b87915d09e31f46eb9a58cca29
  end
end
