class Admin::AdminCustomersController < AdminController
  before_action :load_customer, only: %i(destroy edit update)

  def index
    @admin_customers = User.customer
                           .filter_by_address(params[:customer_address])
                           .filter_by_name(params[:customer_name])
                           .filter_by_email(params[:customer_email])
                           .page(params[:page]).per Settings.admin_customer.per_page
  end

  def edit; end

  def update
    if @customer.update customer_update_params
      flash[:success] = t "admin_customer.update.update_success"
      redirect_to admin_admin_customers_path
    else
      flash[:danger] = t "admin_customer.update.update_fail"
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      flash[:success] = t "admin_customer.delete.delete_success"
    else
      flash[:danger] = t "admin_customer.delete.delete_fail"
    end
    redirect_to admin_admin_customers_path
  end

  private

  def customer_update_params
    params.require(:user).permit User::CUSTOMER_UPDATE_PARAMS
  end

  def load_customer
    @customer = User.find_by id: params[:id]
    return if @customer

    flash[:danger] = t "admin_customer.not_found_user"
    redirect_to admin_admin_customers_path
  end
end
