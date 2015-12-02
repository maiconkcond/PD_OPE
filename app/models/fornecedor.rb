class Fornecedor < ActiveRecord::Base

	validates :razao_social, :nome_fantasia, presence: true
	validates :razao_social, :nome_fantasia, uniqueness: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.razao_social.upcase!
    self.nome_fantasia.upcase!
    self.endereco.upcase!
    self.bairro.upcase!
    self.tel1.upcase!
    self.tel2.upcase!
  end

end
