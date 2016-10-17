json.array!(@notedisciplinari) do |notadisciplinare|
  json.extract! notadisciplinare, :id, :data, :oggetto
  json.url notadisciplinare_url(notadisciplinare, format: :json)
end
