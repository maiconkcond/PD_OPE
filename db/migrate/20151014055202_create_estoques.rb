class CreateEstoques < ActiveRecord::Migration
  def change
    create_table :estoques do |t|
      t.string :nome
      t.integer :quantidade
      t.references :fabricante, index: true, foreign_key: true
      t.references :fornecedor, index: true, foreign_key: true
      t.references :grupo_estoque, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
