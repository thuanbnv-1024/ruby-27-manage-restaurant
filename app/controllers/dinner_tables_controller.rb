class DinnerTablesController < ApplicationController
  def index
    @dinner_tables = DinnerTable.page(params[:page]).per Settings.table.numb
  end
end
