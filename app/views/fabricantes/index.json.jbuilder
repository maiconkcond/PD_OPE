json.array!(@fabricantes) do |fabricante|
  json.extract! fabricante, :id, :nome, :tel1, :tel2
  json.url fabricante_url(fabricante, format: :json)
end
