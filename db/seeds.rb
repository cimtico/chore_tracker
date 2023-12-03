# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Chore.create(name: "Clean up room", value: 100)
Chore.create(name: "Put clothes to wash", value: 100)
Chore.create(name: "Put bedsheets to wash", value: 100)
Chore.create(name: "Put dishes in the dishwasher", value: 100)
Chore.create(name: "Pick up clothes", value: 100)
Chore.create(name: "Take bella out", value: 100)
Chore.create(name: "Cleanup home mess (shoes, toys, etc)", value: 100)
