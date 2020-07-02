class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :value
      t.string :unit

      t.timestamps
    end
  end
end
