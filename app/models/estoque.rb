class Estoque < ActiveRecord::Base
  belongs_to :fabricante
  belongs_to :fornecedor
  belongs_to :grupo_estoque
end
