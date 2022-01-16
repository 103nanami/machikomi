class Public::ColumnsController < ApplicationController
  def index
    @columns = Column.all
    @column_ranks = Column.find(Favorite.group(:post_id).order('count(column_id) desc').limit(5).pluck(:post_id))
  end

  def show
   @column = Column.find(params[:id])
  end

  private
  def column_params
    params.require(:column).permit(:title, :text, :image)
  end
end
