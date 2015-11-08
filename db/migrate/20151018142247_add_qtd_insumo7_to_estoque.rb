class AddQtdInsumo7ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo7, :decimal
  end
end
