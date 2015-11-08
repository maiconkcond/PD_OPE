class AddMedIns5ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins5, :string
  end
end
