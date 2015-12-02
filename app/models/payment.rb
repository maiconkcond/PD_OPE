class Payment < ActiveRecord::Base
	validates :descricao, presence: true
	validates :descricao, uniqueness: true

	before_validation :uppercase_campo

  def uppercase_campo
    self.descricao.upcase!
  end
end
