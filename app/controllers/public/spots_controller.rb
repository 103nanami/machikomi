class Public::SpotsController < ApplicationController
  def index
    
  end

  private
  def spot_params
    params.require(:spot).permit(:latitude, :longitude)
  end
end
