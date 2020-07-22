class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :dish

  enum status: {pending: 0, success: 1}

  scope :load_items, ->(order_id){where "order_id = ?", order_id}
end
