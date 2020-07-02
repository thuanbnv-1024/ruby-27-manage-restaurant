class AddDishToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :dish, null: false, foreign_key: true
  end
end
