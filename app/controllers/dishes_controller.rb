class DishesController < ApplicationController
  def index
    @dishs = Dish.search(params[:search])
  end
end
