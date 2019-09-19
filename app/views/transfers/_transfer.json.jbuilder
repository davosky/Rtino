json.extract! transfer, :id, :name, :transfer_date, :departure, :start_point, :start_address, :arrival, :destination, :destination_address, :path_lenght, :transport_id, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
