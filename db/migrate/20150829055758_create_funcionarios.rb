class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :cargo
      t.string :salario
      t.string :comissao
      t.string :endereco
      t.string :cep
      t.string :tel
      t.string :cel

      t.timestamps null: false
    end
  end
end
