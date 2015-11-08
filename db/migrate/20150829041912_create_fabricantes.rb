class CreateFabricantes < ActiveRecord::Migration
  def change
    create_table :fabricantes do |t|
      t.string :nome
      t.string :tel1
      t.string :tel2
      t.string :tel3

      t.timestamps null: false
    end
  end
end
