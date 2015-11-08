class AddInsumo8ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo8, :string
  end
end
