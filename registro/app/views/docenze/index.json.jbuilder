json.array!(@docenze) do |docenza|
  json.extract! docenza, :id, :cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :email, :password
  json.url docenza_url(docenza, format: :json)
end
