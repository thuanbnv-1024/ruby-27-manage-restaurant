class AddFoodToInputSlipItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :input_slip_items, :food, null: false, foreign_key: true
  end
end
