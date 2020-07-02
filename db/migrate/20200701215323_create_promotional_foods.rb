class CreatePromotionalFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :promotional_foods do |t|
      t.date :start_day
      t.date :end_day
      t.text :description

      t.timestamps
    end
  end
end
