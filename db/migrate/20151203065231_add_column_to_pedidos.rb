class AddColumnToPedidos < ActiveRecord::Migration
  def change
    add_column :pedidos, :total, :double
  end
end
