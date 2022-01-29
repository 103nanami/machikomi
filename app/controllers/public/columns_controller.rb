class Public::ColumnsController < ApplicationController

  layout 'user'

  before_action :authenticate_user!,except: [:index]

  def index
    @columns = Column.page(params[:page]).per(12)
    @column_ranks = Column.find(ColumnFavorite.group(:column_id).order('count(column_id) desc').limit(5).pluck(:column_id))
    @cities = City.all
  end

  def show
    @column = Column.find(params[:id])
  end

  private
  def column_params
    params.require(:column).permit(:title, :text, :image, :city_id)
  end
end
