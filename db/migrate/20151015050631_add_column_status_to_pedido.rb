class AddColumnStatusToPedido < ActiveRecord::Migration
  def change
    add_column :pedidos, :status, :integer
  end
end
