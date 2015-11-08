class AddInsumo3ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo3, :string
  end
end
