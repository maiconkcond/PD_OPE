class ItensPedido < ActiveRecord::Base
  belongs_to :estoque
  belongs_to :pedido
  belongs_to :grupo_estoque
end
