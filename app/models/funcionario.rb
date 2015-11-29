class Funcionario < ActiveRecord::Base
	validates :nome, presence: true
	validates :nome, uniqueness: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.nome.upcase!
    self.cargo.upcase!
    self.salario.upcase!
    self.comissao.upcase!
    self.endereco.upcase!
    self.cep.upcase!
    self.tel.upcase!
    self.cel.upcase!
  end
end
