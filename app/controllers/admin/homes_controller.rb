class Admin::HomesController < ApplicationController

  layout 'admin'

  def top
    @columns = Column.search(params[:keyword]).order(created_at: :desc)
    @pages = Column.page(params[:page]).per(9)
  end


end
