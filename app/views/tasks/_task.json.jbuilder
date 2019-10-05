json.extract! task, :id, :name, :start_date, :end_date, :project_id, :description, :created_at, :updated_at
json.url task_url(task, format: :json)
