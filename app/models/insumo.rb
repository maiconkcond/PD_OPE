class Insumo < ActiveRecord::Base


	validates :descricao, presence: true
	validates :descricao, uniqueness: true
	#validades :quantidade, numericality: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.descricao.upcase!
    #self.unid_med.upcase!
  end
end
