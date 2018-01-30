class RemoveUserIdFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :user_id, :integer
  end
end
