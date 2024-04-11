# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# In your seeds.rb or console

Leader.create!(
  first_name: 'Eric',
  last_name: 'Mutembei',
  phone_number: '0794457203',
  national_id: '40665929',
  gender: 'male',
  email: 'ericmutembei337@gmail.com',
  password: '!eric40665929',
  code: 'pychang'
)

Type.create(name: "1 bedroom")
Type.create(name: "2 bedroom")
Type.create(name: "3 bedroom")
Type.create(name: "4 bedroom")
Type.create(name: "Bedsitter")
Type.create(name: "Apartments")
Type.create(name: "Bungalows")
Type.create(name: "Mansionette")
Type.create(name: "Home compound")
Type.create(name: "Hotels")
Type.create(name: "AirBnBs")
Type.create(name: "Single room")



# Sample data for around 10 residences
# Modify your seed data to include at least 10 photos for each house
require 'faker'

# Create 10 residences with Faker-generated data
10.times do
  Residence.create(
    house_code: Faker::Lorem.characters(number: 10),
    type: Faker::Lorem.word,
    status: Faker::Lorem.word,
    price: Faker::Number.decimal(l_digits: 5, r_digits: 2),
    town: Faker::Address.city,
    google_maps: Faker::Internet.url,
    user_agreement: Faker::Lorem.paragraph,
    description: Faker::Lorem.paragraph,
    institution: Faker::Lorem.word,
    contact_number: Faker::PhoneNumber.cell_phone,
  )
end

