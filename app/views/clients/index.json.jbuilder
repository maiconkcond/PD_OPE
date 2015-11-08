json.array!(@clients) do |client|
  json.extract! client, :id, :nome, :endereco, :complemento, :bairro, :cidade, :cep, :tel1, :tel2, :cel1, :cel2, :email, :obs
  json.url client_url(client, format: :json)
end
