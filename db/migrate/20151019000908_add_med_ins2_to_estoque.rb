class AddMedIns2ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins2, :string
  end
end
