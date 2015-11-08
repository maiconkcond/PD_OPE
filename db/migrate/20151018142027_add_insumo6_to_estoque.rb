class AddInsumo6ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :insumo6, :string
  end
end
