json.array!(@voti) do |voto|
  json.extract! voto, :id, :data, :valore, :materia_id, :docenza_id, :alunno_id
  json.url voto_url(voto, format: :json)
end
