class CreateStaffWorkShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_work_shifts do |t|
      t.timestamps
    end
  end
end
