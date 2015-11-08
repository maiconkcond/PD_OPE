class AddQtdMinimaToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :qtd_minima, :decimal
  end
end
