class RemoveNumbersFromOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :numbers, :integer
  end
end
