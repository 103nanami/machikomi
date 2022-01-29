class Public::PostsController < ApplicationController

  layout 'user'

  before_action :authenticate_user!,except: [:index]

  def index
    @cities = City.all
    @post_ranks = Post.find(PostFavorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))

    if params[:city_id]

      @city = City.find(params[:city_id])

      @posts = @city.posts.page(params[:page]).per(12)
    else

      @posts = Post.page(params[:page]).per(12)
    end
  end

  def new
    @post = Post.new
    @cities = City.all
  end

  def create
    @cities = City.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @post_ranks = Post.find(PostFavorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @cities = City.all
  end

  def edit
    @post = Post.find(params[:id])
    @cities = City.all
  end

  def update
    @cities = City.all
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def spot
    @posts = Post.where(params[:lat]).where(params[:lng])
  end

  private
  def post_params
    params.require(:post).permit(:post_name, :post_text, :image, :city_id, :user_id, :lat, :lng)
  end

end