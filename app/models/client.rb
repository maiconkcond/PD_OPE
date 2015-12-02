class Client < ActiveRecord::Base
	validates :nome, :endereco, :tel1, presence: true
	validates :nome, :tel1, uniqueness: true
	
	before_validation :uppercase_campo
	#before_validation :uppercase_outros_campos

  def uppercase_campo
    self.nome.upcase!
    self.endereco.upcase!
    self.complemento.upcase!
    self.bairro.upcase!
    self.email.upcase!
    self.obs.upcase!
   self.cidade.upcase!
  end


end
