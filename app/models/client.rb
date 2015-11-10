class Client < ActiveRecord::Base
	validates :nome,  presence: true
end
