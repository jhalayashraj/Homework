class AddCleanerIdToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :cleaner_id, :integer
  end
end
