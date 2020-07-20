class AddUnitPriceToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :unit_price, :decimal, precision: 3
  end
end
