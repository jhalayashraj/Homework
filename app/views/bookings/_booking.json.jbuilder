json.extract! booking, :id, :city, :date_and_time, :created_at, :updated_at
json.url booking_url(booking, format: :json)
