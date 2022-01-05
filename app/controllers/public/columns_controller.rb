class Public::ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.show(params[:id])
  end

  private
  def column_params
    params.require(:column).permit(:name, :text, :image)
  end
end
