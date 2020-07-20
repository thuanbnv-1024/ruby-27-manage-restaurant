class Admin::OrdersController < AdminController
  before_action :load_order, only: :show
  skip_before_action :verify_authenticity_token

  def index
    @orders = Order.page(params[:page]).per Settings.orders.per_page
  end

  def show; end

  def update
    order_item = OrderItem.find_by id: params[:id]
    status = false
    order_item.success! && status = true if order_item&.pending?
    respond_to do |format|
      format.js {render json: { status: status }}
    end
  end

  private

  def load_order
    @order = Order.includes(:order_items).find_by(id: params[:id])
    return if @order

    flash[:danger] = t "order.not_found"
    redirect_to admin_orders_path
  end
end
