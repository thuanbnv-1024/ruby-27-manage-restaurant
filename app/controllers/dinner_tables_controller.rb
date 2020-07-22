class DinnerTablesController < ApplicationController
  def index
    @dinner_tables = DinnerTable.page(params[:page]).per Settings.table.numb
  end

  def show
    @dishes = Dish.in_stock.by_attributes("%#{params[:search]}%").page(params[:page]).per Settings.table.dish
    @order_item = current_order.order_items.new
    session[:params_id] = params[:id]
  end
end
