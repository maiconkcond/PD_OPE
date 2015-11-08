class CreateGrupoEstoques < ActiveRecord::Migration
  def change
    create_table :grupo_estoques do |t|
      t.string :nome
      t.string :descricao_loga

      t.timestamps null: false
    end
  end
end
