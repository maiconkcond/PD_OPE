json.array!(@insumos) do |insumo|
  json.extract! insumo, :id, :descricao, :quantidade
  json.url insumo_url(insumo, format: :json)
end
