class Public::HomesController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc).limit(5)
    @post_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @column_ranks = Column.find(Favorite.group(:column_id).order('count(column_id) desc').limit(5).pluck(:column_id))
  end
end
