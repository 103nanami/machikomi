class Admin::ColumnsController < ApplicationController
  def new
    @column = Column.new
    @cities = City.all
  end

  def confirm
    #@column = Column.new(column_params)
  end

  def create
    column = Column.new(column_params)
    column.save
    redirect_to admin_path
  end

  def show
    @column = Column.find(params[:id])
  end

  def edit
    @column = Column.find(params[:id])
  end

  def update
    @column = Column.find(params[:id])
    @column.update(column_params)
    redirect_to admin_column_path(@column.id)
  end

  def destroy
    column = Column.find(params[:id])
    column.destroy
    redirect_to admin_columns_path
  end

  private
  def column_params
    params.require(:column).permit(:image, :title, :text ,:city_id)
  end
end
