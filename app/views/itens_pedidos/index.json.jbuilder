json.array!(@itens_pedidos) do |itens_pedido|
  json.extract! itens_pedido, :id, :estoque_id, :pedido_id
  json.url itens_pedido_url(itens_pedido, format: :json)
end
