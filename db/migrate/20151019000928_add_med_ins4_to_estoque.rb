class AddMedIns4ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins4, :string
  end
end
