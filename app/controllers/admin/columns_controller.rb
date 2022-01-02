class Admin::ColumnsController < ApplicationController
  def new
    @column = Column.new
  end

  def confirm
    @column = Column.new(column_params)
  end

  def create
    column = Column.new(column_params)
    column.save
    redirect_to admin_path
  end

  def show
  end

  private
  def column_params
    params.require(:column).permit(:image, :title, :text)
  end
end
