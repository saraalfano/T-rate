# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

user2 = User.create!(email: 'capparelli.1794326@studenti.uniroma1.it',
                     password: 'passwordtest',
                     password_confirmation: 'passwordtest',
                     nome: 'Agnese',
                     cognome: 'Capparelli',
                     username: 'Agnese:)',
                     ruolo: 'Traduttore')

user3 = User.create!(email: 'orlandi.1847682@studenti.uniroma1.it',
                     password: 'passwordtest',
                     password_confirmation: 'passwordtest',
                     nome: 'Andrea',
                     cognome: 'Orlandi',
                     username: 'Swerd',
                     ruolo: 'Project Manager')