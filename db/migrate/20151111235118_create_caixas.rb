class CreateCaixas < ActiveRecord::Migration
  def change
    create_table :caixas do |t|
      t.datetime :data
      t.decimal :valor_inicial
      t.decimal :soma_geral

      t.timestamps null: false
    end
  end
end
