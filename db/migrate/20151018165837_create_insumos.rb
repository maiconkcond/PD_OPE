class CreateInsumos < ActiveRecord::Migration
  def change
    create_table :insumos do |t|
      t.string :descricao
      t.decimal :quantidade

      t.timestamps null: false
    end
  end
end
