json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :nome, :cargo, :salario, :comissao, :endereco, :cep, :tel, :cel
  json.url funcionario_url(funcionario, format: :json)
end
