json.array!(@amministrazioni) do |amministrazione|
  json.extract! amministrazione, :id, :cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :email, :password, :titolo
  json.url amministrazione_url(amministrazione, format: :json)
end
