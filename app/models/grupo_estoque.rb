class GrupoEstoque < ActiveRecord::Base
	validates :nome, :descricao_loga, presence: true
	validates :nome, :descricao_loga, uniqueness: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.nome.upcase!
    self.descricao_loga.upcase!
  end
end
