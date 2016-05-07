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

