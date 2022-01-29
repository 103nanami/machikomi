class Admin::PostsController < ApplicationController

  layout 'admin'

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:post_name, :post_text, :city_id, :image, :user_id, :lat, :lng)
  end
end
