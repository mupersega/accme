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

images = [
  "db/seed_images/29.jpg",
  "db/seed_images/47.jpg",
  "db/seed_images/70.jpg",
  "db/seed_images/73.jpg",
  "db/seed_images/77.jpg",
  "db/seed_images/82.jpg"
]

first_names = %w[Jenny Trina Josie Cecelia Meryl Elspeth Eda Willie Scot Elwood Glenn Barnabas Weatherby Lennox Maris Margh Carlo]
last_names = %w[Wyatt Noble Heath Lamb Jacobs Owen Leblanc Goodwin Choi Daniels Barr Gardner]

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sit amet efficitur augue, condimentum tincidunt risus. Nulla sagittis venenatis elit sed egestas. Nullam quis mattis justo. Sed sollicitudin purus neque. Vestibulum feugiat arcu et ex molestie, non pellentesque massa convallis. Praesent ut quam erat. Curabitur diam purus, viverra eu diam quis, semper laoreet velit. Vestibulum bibendum vulputate diam quis scelerisque. Ut luctus eros sit amet urna semper interdum. Curabitur mattis ultrices dui id euismod. Donec lobortis lectus id cursus blandit. Vivamus massa ligula, gravida nec dui a, porttitor rutrum augue. Vestibulum tempor condimentum erat eu fringilla. Pellentesque habitant morbi tristique."

#  Setup Qualifications
qualification_names = {
  Lmus: 10,
  Amus: 20,
  Bmus: 30,
  PhD: 20
}
qualification_names.each { |k, v| Qualification.create!(name:k, weight:v) }

# Setup Majors
major_names = [
  "Undisclosed",
  "Piano",
  "Violin",
  "Piano Performance",
  "Piano Accompaniment"
]
major_names.each { |name| Major.create!(name:name) }

qualifications = Qualification.all.map {|obj| obj[:name]}
majorslist = Major.all

# Build random accompanist profiles for each available profile images.
images.each_with_index do |path, i|
  quals = qualifications.dup
  first = first_names.sample()
  last = last_names.sample()
  # create USER
  new_user = User.create(
    email:"acc#{i}@user.com",
    password:"password")
  # create PROFILE
  profile = Profile.create!(
    user: new_user,
    first_name:first,
    last_name:last,
    phone:"0400 123 123",
    blurb:lorem[0..rand(480)],
    contactable: rand(2) == 1 ? true : false,
    picture: {io: File.open(Rails.root.join(path)), filename: "foo.jpg"}
  )
  # set profile's QUALIFICATION info
  rand(0..quals.length).times do |i|
    quals.shuffle()
    ProfileQualification.create!(
      profile: profile,
      major: Major.all.sample,
      qualification: Qualification.find_by(name: quals.pop())
    )
  end
end
