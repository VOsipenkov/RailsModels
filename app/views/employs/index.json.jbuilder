json.array!(@employs) do |employ|
  json.extract! employ, :id, :name, :position, :phone, :organization_id
  json.url employ_url(employ, format: :json)
end
