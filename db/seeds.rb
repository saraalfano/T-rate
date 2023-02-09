# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

user1 = User.create!(email: 'pm@trate.test',
                     password: 'pmpasswordtest',
                     password_confirmation: 'pmpasswordtest',
                     nome: 'PM',
                     cognome: 'Test',
                     username: 'projman',
                     ruolo: 'Project Manager',
                     score: 5.5)

user2 = User.create!(email: 'traduttore@trate.test',
                     password: 'traduttorepasswordtest',
                     password_confirmation: 'traduttorepasswordtest',
                     nome: 'Traduttore',
                     cognome: 'Test',
                     username: 'trad',
                     ruolo: 'Traduttore',
                     score: 3.2)

user3 = User.create!(email: 'utente@trate.test',
                     password: 'utentepasswordtest',
                     password_confirmation: 'utentepasswordtest',
                     nome: 'Utente',
                     cognome: 'Test',
                     username: 'uten',
                     ruolo: 'Utente',
                     score: 0.0)