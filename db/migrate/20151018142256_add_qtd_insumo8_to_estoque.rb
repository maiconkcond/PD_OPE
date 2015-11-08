class AddQtdInsumo8ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo8, :decimal
  end
end
