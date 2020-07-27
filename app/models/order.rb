class Order < ApplicationRecord
  ORDER_PARAMS = %i(payment_method status).freeze
  belongs_to :user
  belongs_to :dinner_table
  has_many :order_items, dependent: :destroy

  delegate :table_number, to: :dinner_table, prefix: :dinner_table
  delegate :name, to: :user, prefix: :user

  enum payment_method: {cash: 0, card: 1}
  enum status: {processing: 0, complete: 1}

  scope :order_by_dish_type, ->{order name: :asc}
  scope :order_by_status, ->{order status: :asc}
  scope :search_table_orders, ->(table){where "dinner_table_id = ?", table if table.present?}

  before_save :update_subtotal

  private

  def subtotal
    order_items.map{|order_item| order_item.valid? ? (order_item.quantity * order_item.send(:unit_price)) : 0}.sum
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
