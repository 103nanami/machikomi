class Public::CitiesController < ApplicationController
  def index
    @cities = City.all
    @column = Column.show
  end

  private
  def city_params
    params.require(:city).permit(:name)
  end
end
