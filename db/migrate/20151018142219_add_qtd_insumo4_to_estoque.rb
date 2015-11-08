class AddQtdInsumo4ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo4, :decimal
  end
end
