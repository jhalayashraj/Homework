class AddCustomerIdToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :customer_id, :integer
  end
end
