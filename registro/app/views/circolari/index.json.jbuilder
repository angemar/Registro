json.array!(@circolari) do |circolare|
  json.extract! circolare, :id, :numero, :dataemissione, :titolo, :oggetto
  json.url circolare_url(circolare, format: :json)
end
