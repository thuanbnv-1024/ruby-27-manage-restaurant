class CreateBookTables < ActiveRecord::Migration[6.0]
  def change
    create_table :book_tables do |t|
      t.time :start_time
      t.boolean :status
      t.text :description

      t.timestamps
    end
  end
end
