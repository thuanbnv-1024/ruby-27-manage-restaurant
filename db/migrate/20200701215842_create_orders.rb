class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :table_number
      t.decimal :prices
      t.string :payment_method
      t.text :description

      t.timestamps
    end
  end
end
