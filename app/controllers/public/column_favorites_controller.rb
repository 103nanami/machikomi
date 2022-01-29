class Public::ColumnFavoritesController < ApplicationController
  def create
    @column = Column.find(params[:column_id])
    favorite = current_user.column_favorites.new(column_id: @column.id)
    favorite.save!
  end

  def destroy
    @column = Column.find(params[:column_id])
    favorite = current_user.column_favorites.find_by(column_id: @column.id)
    favorite.destroy
  end

end
