class AddMedIns7ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins7, :string
  end
end
