json.array!(@estoques) do |estoque|
  json.extract! estoque, :id, :nome, :quantidade, :fabricante_id, :fornecedor_id, :grupo_estoque_id
  json.url estoque_url(estoque, format: :json)
end
