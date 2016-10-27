json.array!(@docenza_sezione_materie) do |docenza_sezione_materia|
  json.extract! docenza_sezione_materia, :id, :docenza_id, :sezione_id, :materia_id
  json.url docenza_sezione_materia_url(docenza_sezione_materia, format: :json)
end
