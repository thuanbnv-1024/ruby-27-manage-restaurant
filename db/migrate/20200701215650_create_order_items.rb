class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :numbers
      t.boolean :status

      t.timestamps
    end
  end
end
