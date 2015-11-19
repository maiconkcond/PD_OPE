class AddValorUnitToItensPedido < ActiveRecord::Migration
  def change
    add_column :itens_pedidos, :valor_unit, :decimal
  end
end
