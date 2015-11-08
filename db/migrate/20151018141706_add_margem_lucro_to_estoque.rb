class AddMargemLucroToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :margem_lucro, :decimal
  end
end
