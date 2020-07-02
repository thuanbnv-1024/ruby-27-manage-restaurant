class CreateWorkShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :work_shifts do |t|
      t.string :name
      t.time :start_time

      t.timestamps
    end
  end
end
