class AddQtdInsumo5ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_insumo5, :decimal
  end
end
