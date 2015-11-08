class AddidGrupoDeEstoqueToItensPedidos < ActiveRecord::Migration
  def change
  	add_column :itens_pedidos, :grupo_estoque_id, :integer
  end
end
