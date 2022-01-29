class Public::PostFavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.post_favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.post_favorites.where(post_id: @post.id)
    favorite.destroy_all
  end

end
