class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)

    column = Column.find(params[:column_id])
    favorite = current_user.favorites.new(column_id: column.id)
    favorite.save
    redirect_to column_path(column)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)

    column = Column.find(params[:column_id])
    favorite = current_user.favorites.find_by(column_id: column.id)
    favorite.destroy
    redirect_to column_path(column)
  end
end

