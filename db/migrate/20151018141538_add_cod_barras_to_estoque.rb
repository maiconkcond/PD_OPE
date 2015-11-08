class AddCodBarrasToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :cod_barras, :text
  end
end
