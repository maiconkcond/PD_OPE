class EstoquePolicy < ApplicationPolicy
	
	def index?
		user.admin?
	end

	def new?
		user.admin?
	end

	class Scope < Scope
		def resolve
			scope
		end
	end
end
