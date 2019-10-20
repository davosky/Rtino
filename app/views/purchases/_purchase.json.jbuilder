json.extract! purchase, :id, :name, :location_id, :structure_id, :category_id, :request_person, :request_date, :purchase_approval_date, :purchase_approval_person, :purchase_date, :purchase_typology_id, :vendor_id, :amount, :delivery_date, :description, :installation_date, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
