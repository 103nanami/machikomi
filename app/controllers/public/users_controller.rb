class Public::UsersController < ApplicationController
  def show
    @user = User.show(params[:id])
  end

  def edit
    @user = User.show(params[:id])
  end

  def update
    user = User.show(params[:id])
    user.update
    redirect_to users_my_page_path(current_user.id)
  end

  def post
  end

  def favorite
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
