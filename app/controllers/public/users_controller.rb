class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update
    redirect_to users_my_page_path(current_user.id)
  end

  def post
    @my_posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def favorite
    #@user = User.find(params[:id])
    #@posts = @user.posts
    favorite_posts = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_post_lists = Favorite.find(favorite_posts)

    favorite_columns = Favorite.where(user_id: current_user.id).pluck(:column_id)
    @favorite_column_lists = Favorite.find(favorite_columns)
  end

  def confirm
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :birth_year, :birth_month, :birth_day, :postal_code, :address)
  end
end
