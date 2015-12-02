class Fabricante < ActiveRecord::Base

	validates :nome, presence: true
	validates :nome, uniqueness: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.nome.upcase!
  end
end
