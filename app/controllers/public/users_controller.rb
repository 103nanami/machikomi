class Public::UsersController < ApplicationController

  layout 'user'

  def my_page
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_my_page_path(current_user.id)
  end

  def post
    @my_posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @posts = Post.page(params[:page]).per(9)
  end

  def favorite
    post_favorites_by_user_id =  PostFavorite.where(user_id: current_user.id)
    post_favorite_ids = post_favorites_by_user_id.pluck(:post_id)
    @post_favorites = Post.where(id: post_favorite_ids)

    column_favorites_by_user_id = ColumnFavorite.where(user_id: current_user.id)
    column_favorite_ids = column_favorites_by_user_id.pluck(:column_id)
    @column_favorites = Column.where(id: column_favorite_ids)

    @posts = Post.page(params[:page]).per(9)
  end

  def confirm
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :birth_year, :birth_month, :birth_day, :postal_code, :address, :image)
  end
end
