class Public::HomesController < ApplicationController


  before_action :authenticate_user!,except: [:top]

  def top
    @posts = Post.order(created_at: :desc).limit(4)
    @post_ranks = Post.find(PostFavorite.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
    @column_ranks = Column.find(ColumnFavorite.group(:column_id).order('count(column_id) desc').limit(4).pluck(:column_id))
  end
end
