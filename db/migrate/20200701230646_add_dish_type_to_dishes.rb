class AddDishTypeToDishes < ActiveRecord::Migration[6.0]
  def change
    add_reference :dishes, :dish_type, null: false, foreign_key: true
  end
end
