class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :created_at, :is_active)
  end
end
