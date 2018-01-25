class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :city
      t.datetime :date_and_time

      t.timestamps
    end
  end
end
