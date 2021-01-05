json.extract! course, :id, :name, :description, :start_date, :end_date, :organization_id, :created_at, :updated_at
json.url course_url(course, format: :json)
