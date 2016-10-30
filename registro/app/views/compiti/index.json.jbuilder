json.array!(@compiti) do |compito|
  json.extract! compito, :id, :data, :oggetto, :docenza_id, :sezione_id, :materia_id
  json.url compito_url(compito, format: :json)
end
