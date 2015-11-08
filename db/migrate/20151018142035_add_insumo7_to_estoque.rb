class AddInsumo7ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo7, :string
  end
end
