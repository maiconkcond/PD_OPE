class AddUnidMedToInsumo < ActiveRecord::Migration
  def change
    add_column :insumos, :unid_med, :string
  end
end
