class AddQtdInsumo6ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo6, :decimal
  end
end
