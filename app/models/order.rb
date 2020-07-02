class Order < ApplicationRecord
  belongs_to :user

  enum payment_method: {cash: 0, card: 1}
end
