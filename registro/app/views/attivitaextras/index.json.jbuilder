json.array!(@attivitaextras) do |attivitaextra|
  json.extract! attivitaextra, :id, :descrizione, :datainizio, :datafine, :luogo, :orainizio, :orafine
  json.url attivitaextra_url(attivitaextra, format: :json)
end