class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :birthday
      t.integer :gender
      t.string :address
      t.integer :phone
      t.string :password_digest
      t.string :role
      t.string :activation_digest
      t.string :activated

      t.timestamps
    end
  end
end
