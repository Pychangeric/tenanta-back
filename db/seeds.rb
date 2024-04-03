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
admin = Admin.create(email: 'pychangeric@gmail.com', password: '!eric40665929', password_confirmation: '!eric40665929')



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

