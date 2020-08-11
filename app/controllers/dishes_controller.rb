class DishesController < ApplicationController
  def index
    @search = Dish.search(params[:q])
    @dishs = @search.result.includes(:images).page(params[:page]).per Settings.dishes.per_page
  end
end
