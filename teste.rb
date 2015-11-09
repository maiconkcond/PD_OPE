require 'correios-cep'

# With "get" instance method
finder = Correios::CEP::AddressFinder.new
address = finder.get("54250610")

# With "get" class method
address = Correios::CEP::AddressFinder.get("54250610")

