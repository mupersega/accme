# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.destroy_all
User.destroy_all
Major.destroy_all
Qualification.destroy_all

User.create!(email:"a@b.com", password:"abc123")
User.create!(email:"b@c.com", password:"abc123")
User.create!(email:"c@d.com", password:"abc123")
User.create!(email:"d@e.com", password:"abc123")


Profile.create!(first_name:"cam", last_name:"tee", user:User.first)
Profile.create!(first_name:"john", last_name:"doe", user:User.second)
Profile.create!(first_name:"bruce", last_name:"banner", user:User.third)
Profile.create!(first_name:"wonder", last_name:"woman", user:User.fourth)


Major.create!(name:"Piano Performance")
Major.create!(name:"Piano Accompaniment")
Major.create!(name:"Violin")
Major.create!(name:"Piano")
Major.create!(name: "Undisclosed")

Qualification.create!(name:"Lmus", weight:10)
Qualification.create!(name:"Amus", weight:20)
Qualification.create!(name:"Bmus", weight:30)
Qualification.create!(name:"Bmus", weight:40)


