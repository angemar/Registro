json.array!(@sezioni) do |sezione|
  json.extract! sezione, :id, :lettera, :numero
  json.url sezione_url(sezione, format: :json)
end
