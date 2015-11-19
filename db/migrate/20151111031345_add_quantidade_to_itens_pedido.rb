class AddQuantidadeToItensPedido < ActiveRecord::Migration
  def change
    add_column :itens_pedidos, :quantidade, :integer
  end
end
