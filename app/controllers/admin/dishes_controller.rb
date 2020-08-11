class Admin::DishesController < AdminController
  before_action :load_dish, except: %i(new create index)

  include DishesHelper

  def index
    @dishes = Dish.includes(:images).page(params[:page]).per(Settings.dishes.per_page)
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new dish_params
    if @dish.save
      flash[:success] = t "dish_types.create_success"
      redirect_to admin_dishes_path
    else
      flash[:danger] = t "dish_types.create_error"
      render :new
    end
  end

  def edit; end

  def update
    if @dish.update dish_params
      flash[:success] = t "dishes.update_success"
      redirect_to admin_dishes_path
    else
      flash[:danger] = t "dishes.update_error"
      render :edit
    end
  end

  def destroy
    if @dish.destroy
      flash[:success] = t "dish_types.delete_success"
    else
      flash[:danger] = t "dish_types.delete_error"
    end
    redirect_to admin_dishes_path
  end

  private

  def dish_params
    params.require(:dish).permit Dish::DISHES_PARAMS
  end

  def load_dish
    @dish = Dish.find_by id: params[:id]
    return if @dish

    flash[:danger] = t "dish_types.not_found"
    redirect_to admin_dishes_path
  end
end
