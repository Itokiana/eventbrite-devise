json.extract! event, :id, :description, :date, :place, :created_at, :updated_at
json.url event_url(event, format: :json)
