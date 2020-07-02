class AddUserToStaffWorkShifts < ActiveRecord::Migration[6.0]
  def change
    add_reference :staff_work_shifts, :user, null: false, foreign_key: true
  end
end
