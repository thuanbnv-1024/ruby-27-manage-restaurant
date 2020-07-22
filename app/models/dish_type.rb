class DishType < ApplicationRecord
  DISH_TYPES_PARAMS = %i(name description).freeze
  has_many :dishes, dependent: :destroy

  scope :order_by_dish_type, ->{order name: :asc}
end
