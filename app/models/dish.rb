class Dish < ApplicationRecord
  belongs_to :dish_type

  enum status: {out_of_stock: 0, in_stock: 1}
end
