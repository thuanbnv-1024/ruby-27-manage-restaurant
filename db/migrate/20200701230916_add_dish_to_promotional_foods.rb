class AddDishToPromotionalFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :promotional_foods, :dish, null: false, foreign_key: true
  end
end
