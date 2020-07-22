class OrderItem < ApplicationRecord
  ORDER_ITEMS_PARAMS = %i(quantity dish_id).freeze

  belongs_to :order
  belongs_to :dish

  validates :quantity, presence: true,
             numericality: {only_integer: true, greater_than: 0}

  before_save :finalize

  scope :load_items, ->(order_id){where "order_id = ?", order_id}

  enum status: {pending: 0, success: 1}

  def total_price
    unit_price * quantity
  end

  private

  def unit_price
    if persisted?
      self[:unit_price]
    else
      dish.price
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total] = quantity * self[:unit_price]
  end
end
