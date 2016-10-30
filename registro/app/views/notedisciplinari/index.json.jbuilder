json.array!(@notedisciplinari) do |notadisciplinare|
  json.extract! notadisciplinare, :id, :data, :oggetto, :sezione_id, :alunno_id
  json.url notadisciplinare_url(notadisciplinare, format: :json)
end
