class AddQtdInsumo3ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo3, :decimal
  end
end
