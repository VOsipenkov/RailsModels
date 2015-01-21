json.array!(@employments) do |employment|
  json.extract! employment, :id, :nameTask, :status, :date, :employ_id
  json.url employment_url(employment, format: :json)
end
