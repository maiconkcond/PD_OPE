class Pedido < ActiveRecord::Base
  belongs_to :client
  has_many :itens_pedido, dependent: :destroy 
  
end
