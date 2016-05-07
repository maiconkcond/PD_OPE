class CreateItensCaixas < ActiveRecord::Migration
  def change
    create_table :itens_caixas do |t|
      t.decimal :total
      t.decimal :total_retirado
      t.integer :id_forma_pagamento

      t.timestamps null: false
    end
  end
end
