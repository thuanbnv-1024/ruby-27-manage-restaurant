class Admin::OrderInvoicesController < AdminController
  include OrderInvoicesHelper
  before_action :load_order, :load_order_item, only: %i(edit show update)

  def index
    @order_invoices = Order.order_by_status
                           .search_table_orders(params[:option_table])
                           .page(params[:page]).per Settings.orders.per_page
  end

  def show; end

  def edit; end

  def update
    if @order_invoice.update order_params
      flash[:success] = t "dishes.update_success"
      redirect_to admin_order_invoices_path
    else
      flash[:danger] = t "dishes.update_error"
      render :edit
    end
  end

  private

  def load_order
    @order_invoice = Order.find_by id: params[:id]
    return if @order_invoice

    flash[:danger] = t "order.not_found"
    redirect_to admin_order_invoices_path
  end

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end

  def load_order_item
    @order_invoice_show = OrderItem.load_items params[:id]
  end
end
