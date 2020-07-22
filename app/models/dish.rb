class Dish < ApplicationRecord
  DISHES_PARAMS = [:name, :price, :description, :dish_type_id, :status,
    images_attributes: [:id, :image, :image_cache, :_destroy]].freeze

  belongs_to :dish_type
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

  enum status: {out_of_stock: 0, in_stock: 1}

  scope :search, (lambda do |param|
    where("name LIKE '%#{param}%'").or(where("description LIKE '%#{param}%'")) if param.present?
  end)
  scope :fillter_by_price, (lambda do |price_min, price_max|
    where("price BETWEEN #{price_min} AND #{price_max} ") if price_min.present? && price_max.present?
  end)
  scope :by_attributes, (lambda do |param|
    where("name LIKE :search", search: "%#{param}%").or(where("description LIKE :search", search: "%#{param}%"))
  end)
end
