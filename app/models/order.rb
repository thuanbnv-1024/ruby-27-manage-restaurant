class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dinner_table
  has_many :order_items, dependent: :destroy

  delegate :table_number, to: :dinner_table, prefix: :dinner_table
  delegate :name, to: :user, prefix: :user

  enum payment_method: {cash: 0, card: 1}
end
