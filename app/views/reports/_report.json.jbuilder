json.extract! report, :id, :name, :date, :location_id, :structure_id, :created_at, :updated_at
json.url report_url(report, format: :json)
