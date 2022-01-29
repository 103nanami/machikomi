class Admin::ColumnsController < ApplicationController

  layout 'admin'

  def new
    @column = Column.new
    @cities = City.all
  end

  def create
    @cities = City.all
    @column = Column.new(column_params)
    if @column.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    @column = Column.find(params[:id])
  end

  def confirm
    #@column = Column.find(params[:id])
  end

  def edit
    @column = Column.find(params[:id])
    @cities = City.all
  end

  def update
    @cities = City.all
    @column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to admin_column_path(@column.id)
    else
      render :edit
    end
  end

  def destroy
    column = Column.find(params[:id])
    column.destroy
    redirect_to admin_path
  end

  private
  def column_params
    params.require(:column).permit(:image, :title, :text ,:city_id)
  end
end
