class CreateUnidMeds < ActiveRecord::Migration
  def change
    create_table :unid_meds do |t|
      t.string :descricao
      t.text :abreviacao

      t.timestamps null: false
    end
  end
end
