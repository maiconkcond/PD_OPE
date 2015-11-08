class AddInsumo4ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo4, :string
  end
end
