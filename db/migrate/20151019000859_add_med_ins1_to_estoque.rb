class AddMedIns1ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins1, :string
  end
end
