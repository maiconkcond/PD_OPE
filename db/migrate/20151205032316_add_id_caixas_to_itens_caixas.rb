class AddIdCaixasToItensCaixas < ActiveRecord::Migration
  def change
    add_column :itens_caixas, :id_caixas, :string
  end
end
