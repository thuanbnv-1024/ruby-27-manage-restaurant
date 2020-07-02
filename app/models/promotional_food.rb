class PromotionalFood < ApplicationRecord
  belongs_to :dish
  belongs_to :promotion
end
