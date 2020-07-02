class AddDishToImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :images, :dish, null: false, foreign_key: true
  end
end
