json.array!(@alunno_attivitaextras) do |alunno_attivitaextra|
  json.extract! alunno_attivitaextra, :id, :alunno_id, :attivitaextra_id
  json.url alunno_attivitaextra_url(alunno_attivitaextra, format: :json)
end
