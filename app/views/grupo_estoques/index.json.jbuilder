json.array!(@grupo_estoques) do |grupo_estoque|
  json.extract! grupo_estoque, :id, :nome, :descricao_loga
  json.url grupo_estoque_url(grupo_estoque, format: :json)
end
