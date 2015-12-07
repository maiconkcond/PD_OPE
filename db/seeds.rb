# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Payment.destroy_all
 
 
Payment.create!([
    {
    	id: 1, descricao: "DINHEIRO"
     },
     {
    	id: 2, descricao: "VISA"
    },
    {
    	id: 3, descricao: "MASTER"
    },
    {
    	id: 4, descricao: "ELO"
    }
 ])
 
p "Created #{Payment.count} payments."

GrupoEstoque.destroy_all

GrupoEstoque.create!([
 {
    	id: 1, nome: "PIZZAS", descricao_loga: "PIZZAS DIVERSAS"
     },
     {
     	id: 2, nome: "PIZZAS DOCES", descricao_loga: "PIZZAS DOCES"
     },
     {
     	id: 3, nome: "MINI-PIZZAS", descricao_loga: "MINI PIZZAS"
     },
     {
     	id: 4, nome: "ESFIHAS", descricao_loga: "ESFIHAS"
     },
     {
     	id: 5, nome: "BEBIDAS", descricao_loga: "BEBIDAS DIVERSAS"
     },
 ])
 p "Created #{GrupoEstoques.count} grupo_estoques."


Fabricantes.destroy_all

Fabricantes.create!([
 {
    	id: 1, nome: "COCA COLA", tel1: "36521456"
     },
     {
     	id: 2, nome: "PEPSICO", tel1: "23145478"
     },
     {
     	id: 3, nome: "KRAFT HEINZ", tel1: "25874136"
     },
     {
     	id: 4, nome: "UNILEVER", tel1: "63254121"
     },
 ])
 p "Created #{Fabricantes.count} fabricantes."
 
 
Fornecedors.destroy_all

Fornecedors.create!([
 {
    	id: 1, nome: "COCA COLA", tel1: "36521456"
     },
     {
     	id: 2, nome: "PEPSICO", tel1: "23145478"
     },
     {
     	id: 3, nome: "KRAFT HEINZ", tel1: "25874136"
     },
     {
     	id: 4, nome: "UNILEVER", tel1: "63254121"
     },
 ])
 p "Created #{Fornecedors.count} fornecedors."
