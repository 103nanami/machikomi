class Admin::HomesController < ApplicationController
  def top
    @columns = Column.page(params[:page]).per(9)
  end
end
