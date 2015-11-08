class AddInsumo2ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo2, :string
  end
end
