json.extract! project, :id, :name, :start_date, :end_date, :project_typology_id, :project_priority, :project_description, :location_id, :structure_id, :office_id, :project_status_id, :created_at, :updated_at
json.url project_url(project, format: :json)
