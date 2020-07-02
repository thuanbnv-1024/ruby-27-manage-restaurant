class CreateDinnerTables < ActiveRecord::Migration[6.0]
  def change
    create_table :dinner_tables do |t|
      t.integer :table_number
      t.integer :number_seats
      t.boolean :status

      t.timestamps
    end
  end
end
