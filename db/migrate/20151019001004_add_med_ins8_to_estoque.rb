class AddMedIns8ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins8, :string
  end
end
