class AddObsToEstoque < ActiveRecord::Migration
  def change
    add_column :estoques, :obs, :text
  end
end
