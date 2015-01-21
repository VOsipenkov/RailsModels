json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :email, :address
  json.url organization_url(organization, format: :json)
end
