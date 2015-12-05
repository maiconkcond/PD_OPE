class ItensCaixa < ActiveRecord::Base
	belongs_to :caixa
	belongs_to :payment
end
