class Public::CitiesController < ApplicationController
  def index
    @cities = City.all
    #@column = Column.find(params[:column_id])
  end

  private
  def city_params
    params.require(:city).permit(:name, :column_id)
  end
end
