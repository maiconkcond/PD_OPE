class AddValorCustoToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :valor_custo, :decimal
  end
end
