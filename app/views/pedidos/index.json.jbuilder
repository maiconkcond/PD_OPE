json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :client_id
  json.url pedido_url(pedido, format: :json)
end
