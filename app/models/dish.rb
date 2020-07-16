class Dish < ApplicationRecord
  DISHES_PARAMS = %i(name price description dish_type_id status).freeze
  belongs_to :dish_type

  enum status: {out_of_stock: 0, in_stock: 1}

  scope :search, (lambda do |param|
    where("name LIKE '%#{param}%'").or(where("description LIKE '%#{param}%'")) if param.present?
  end)
end
