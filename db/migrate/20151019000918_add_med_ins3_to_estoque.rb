class AddMedIns3ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins3, :string
  end
end
