json.array!(@alunni) do |alunno|
  json.extract! alunno, :id, :cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :email, :password, :sezione_id
  json.url alunno_url(alunno, format: :json)
end
