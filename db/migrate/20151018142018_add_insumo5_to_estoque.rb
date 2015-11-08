class AddInsumo5ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo5, :string
  end
end
