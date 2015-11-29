class UnidMed < ActiveRecord::Base

	validates :descricao, :abreviacao, presence: true
	validates :descricao, :abreviacao, uniqueness: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.descricao.upcase!
    self.abreviacao.upcase!
  end
end
