class AddQtdInsumo1ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo1, :decimal
  end
end
