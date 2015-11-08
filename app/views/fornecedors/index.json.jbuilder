json.array!(@fornecedors) do |fornecedor|
  json.extract! fornecedor, :id, :razao_social, :nome_fantasia, :endereco, :bairro, :cep, :cep, :cidade, :tel1, :tel2
  json.url fornecedor_url(fornecedor, format: :json)
end
