class CreateFornecedors < ActiveRecord::Migration
  def change
    create_table :fornecedors do |t|
      t.string :razao_social
      t.string :nome_fantasia
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.string :cep
      t.string :cidade
      t.string :tel1
      t.string :tel2

      t.timestamps null: false
    end
  end
end
