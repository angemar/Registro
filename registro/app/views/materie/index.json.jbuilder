json.array!(@materie) do |materia|
  json.extract! materia, :id, :nome
  json.url materia_url(materia, format: :json)
end
