class AddValorVendaToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :valor_venda, :decimal
  end
end
