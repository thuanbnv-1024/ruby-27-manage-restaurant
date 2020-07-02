class CreateInputSlipItems < ActiveRecord::Migration[6.0]
  def change
    create_table :input_slip_items do |t|
      t.decimal :price
      t.integer :number
      t.integer :total

      t.timestamps
    end
  end
end
