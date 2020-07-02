class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.boolean :status
      t.text :description

      t.timestamps
    end
  end
end
