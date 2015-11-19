json.array!(@caixas) do |caixa|
  json.extract! caixa, :id, :data, :valor_inicial, :soma_geral
  json.url caixa_url(caixa, format: :json)
end
