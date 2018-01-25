class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :role
      t.string :city

      t.timestamps
    end
    add_index :users, :phone_number, unique: true
  end
end
