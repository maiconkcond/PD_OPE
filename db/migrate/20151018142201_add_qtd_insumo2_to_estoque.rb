class AddQtdInsumo2ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo2, :decimal
  end
end
