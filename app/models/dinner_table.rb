class DinnerTable < ApplicationRecord
  has_many :orders, dependent: :destroy

  enum status: {free: 0, using: 1}

  scope :filter_status, ->(status){where("status = ?", status) if status.present?}
  scope :order_by_table_numnber, ->{order table_number: :asc}
end
