class Admin::UsersController < ApplicationController

  layout 'admin'

  def index
    @users = User.search(params[:keyword]).order(:id)
    @pages = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def post
     @user = params[:id]
     @user_posts = Post.where(@user).includes(:user).page(params[:page]).per(12)
     @page = Post.page(params[:page]).per(9)
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :created_at, :is_active)
  end
end
