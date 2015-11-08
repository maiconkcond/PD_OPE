class CreateItensPedidos < ActiveRecord::Migration
  def change
    create_table :itens_pedidos do |t|
      t.references :estoque, index: true, foreign_key: true
      t.references :pedido, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
