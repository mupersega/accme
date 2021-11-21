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

# setup an admin with no profile
admin = User.create!(email:"admin@admin.com", password:"admins")
admin.add_role(:admin)

# setup placeholders
User.create!(email:"a@b.com", password:"abc123")
User.create!(email:"b@c.com", password:"abc123")
User.create!(email:"d@b.com", password:"abc123")
User.create!(email:"d@c.com", password:"abc123")
User.create!(email:"a@f.com", password:"abc123")
User.create!(email:"f@c.com", password:"abc123")

Profile.create!(first_name:"caafm", last_name:"tesde", user:User.find(1), blurb:"lorem ipsum dolor sit amet")
Profile.create!(first_name:"jnasdf", last_name:"dodfe", user:User.find(2), blurb:"lorem ipsum dolor sit amet")
Profile.create!(first_name:"jenasdfy", last_name:"reafn", user:User.find(3), blurb:"lorem ipsum dolor sit amet")
Profile.create!(first_name:"gordoan", last_name:"doasdfe", user:User.find(4), blurb:"lorem ipsum dolor sit amet")
Profile.create!(first_name:"cynthdfia", last_name:"upaafo", user:User.find(5), blurb:"lorem ipsum dolor sit amet")
Profile.create!(first_name:"adriaasn", last_name:"roberts", user:User.find(6), blurb:"lorem ipsum dolor sit amet")

# setup base qualifications
Qualification.create!(name:"Lmus", weight:10)
Qualification.create!(name:"Amus", weight:20)
Qualification.create!(name:"Bmus", weight:30)
Qualification.create!(name:"PhD", weight:20)

# setup base majors
Major.create!(name:"Piano Performance")
Major.create!(name:"Piano Accompaniment")
Major.create!(name:"Violin")
Major.create!(name:"Piano")
Major.create!(name: "Undisclosed")
