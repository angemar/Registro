json.array!(@voti) do |voto|
  json.extract! voto, :id, :data, :valore
  json.url voto_url(voto, format: :json)
end
