class AddTotalToItensPedido < ActiveRecord::Migration
  def change
    add_column :itens_pedidos, :total, :decimal
  end
end
