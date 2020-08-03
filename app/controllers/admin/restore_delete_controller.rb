class Admin::RestoreDeleteController < AdminController
  before_action :load_customer, only: :show

  def show
    @customer.restore
    flash[:success] = t "admin_customer.restore_success"
    redirect_to admin_admin_customers_path
  end

  private

  def load_customer
    @customer = User.only_deleted.find_by id: params[:id]
    return if @customer

    flash[:danger] = t "admin_customer.not_found_user"
    redirect_to admin_admin_customers_path
  end
end
