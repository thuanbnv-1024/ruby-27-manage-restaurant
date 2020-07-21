class DishesController < ApplicationController
  def index
    @dishs = Dish.search(params[:search])
                 .fillter_by_price(params[:price_min], params[:price_max])
                 .page(params[:page]).per Settings.dishes.per_page
  end
end
