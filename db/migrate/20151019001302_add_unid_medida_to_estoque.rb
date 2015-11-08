class AddUnidMedidaToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :unid_medida, :string
  end
end
