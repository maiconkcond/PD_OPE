class AddInsumo1ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo1, :string
  end
end
