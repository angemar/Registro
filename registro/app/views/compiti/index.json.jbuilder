json.array!(@compiti) do |compito|
  json.extract! compito, :id, :data, :oggetto
  json.url compito_url(compito, format: :json)
end
