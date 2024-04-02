# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# Sample data for around 10 residences
residences_data = [
  { house_code: "#10001", type: "Apartment", status: "Available", price: 2000, town: "Nairobi", google_maps: "Google Maps URL 1", user_agreement: "User agreement text 1", description: "Description 1", institution: "School 1", contact_us: "0794457203" },
  { house_code: "#10002", type: "Villa", status: "Available", price: 3000, town: "Mombasa", google_maps: "Google Maps URL 2", user_agreement: "User agreement text 2", description: "Description 2", institution: "Hospital 2", contact_us: "0794457203" },
  # Add more residences as needed
]

# Create residences using the seed data
residences_data.each do |data|
  Residence.create!(data)
end
