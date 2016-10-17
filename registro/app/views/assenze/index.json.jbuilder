json.array!(@assenze) do |assenza|
  json.extract! assenza, :id, :date
  json.url assenza_url(assenza, format: :json)
end
