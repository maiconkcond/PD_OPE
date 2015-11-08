class AddMedIns6ToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :med_ins6, :string
  end
end
