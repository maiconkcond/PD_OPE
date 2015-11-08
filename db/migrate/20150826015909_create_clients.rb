class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nome
      t.string :endereco
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :tel1
      t.string :tel2
      t.string :cel1
      t.string :cel2
      t.string :email
      t.text :obs

      t.timestamps null: false
    end
  end
end
