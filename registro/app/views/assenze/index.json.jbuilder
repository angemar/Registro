json.array!(@assenze) do |assenza|
  json.extract! assenza, :id, :date,  :alunno_id, :amministrazione_id
  json.url assenza_url(assenza, format: :json)
end
