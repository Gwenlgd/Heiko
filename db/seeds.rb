# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   food_items = food_item.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", food_item: food_items.first)
require "open-uri"
require "csv"


puts "Cleaning database..."
Feeling.destroy_all
Mood.destroy_all
User.destroy_all
FoodItem.destroy_all

puts "Creating users..."

# USERS

# women
gaby = User.create!(first_name: "Gaby", last_name: "vDB", email: "gvdb@test.com", password: "paradise", age: 29, gender: "Women")
juliette = User.create!(first_name: "Juliette", last_name: "B.", email: "juliette@test.com", password: "paradise", age: 29, gender: "Women")
gwen = User.create!(first_name: "Gwen", last_name: "L.", email: "gwenl@test.com", password: "paradise", age: 29, gender: "Women")
april = User.create!(first_name: "April", last_name: "D.", email: "aprild@test.com", password: "paradise", age: 29, gender: "Women")
silvia = User.create!(first_name: "Silvia", last_name: "P.", email: "silviap@test.com", password: "paradise", age: 29, gender: "Women")
bodil = User.create!(first_name: "Bodil", last_name: "E.", email: "bodile@test.com", password: "paradise", age: 29, gender: "Women")
franka = User.create!(first_name: "Franka", last_name: "S.", email: "franka@test.com", password: "paradise", age: 29, gender: "Women")

#men
gabriel = User.create!(first_name: "Gabriel", last_name: "C.", email: "gabrielc@test.com", password: "paradise", age: 29, gender: "Men")
jules = User.create!(first_name: "Jules", last_name: "D.", email: "julesd@test.com", password: "paradise", age: 29, gender: "Men")
grant = User.create!(first_name: "Grant", last_name: "N.", email: "grantn@test.com", password: "paradise", age: 29, gender: "Men")
eric = User.create!(first_name: "Eric", last_name: "J.", email: "ericj@test.com", password: "paradise", age: 29, gender: "Men")
viktor = User.create!(first_name: "eric", last_name: "F.", email: "viktorf@test.com", password: "paradise", age: 29, gender: "Men")
alex = User.create!(first_name: "Alex", last_name: "R.", email: "alexr@test.com", password: "paradise", age: 29, gender: "Men")


puts "Creating feelings..."

# FEELINGS

# energy
Feeling.create!(name: "Invigorated", category: "Energy")
Feeling.create!(name: "Full of energy", category: "Energy")
Feeling.create!(name: "Tired", category: "Energy")
Feeling.create!(name: "No energy", category: "Energy")

# gut
Feeling.create!(name: "Bloating", category: "Digestion")
Feeling.create!(name: "Stomach pain", category: "Digestion")
Feeling.create!(name: "Gas", category: "Digestion")
Feeling.create!(name: "Diarrhea", category: "Digestion")
Feeling.create!(name: "Constipation", category: "Digestion")
Feeling.create!(name: "Nausea", category: "Digestion")
Feeling.create!(name: "Vomiting", category: "Digestion")


# skin
Feeling.create!(name: "Pimples", category: "Skin")
Feeling.create!(name: "Eczema", category: "Skin")


# body
Feeling.create!(name: "Headache", category: "Body")
Feeling.create!(name: "Hayfever", category: "Body")
Feeling.create!(name: "Asthma", category: "Body")


puts "Creating moods..."

# MOODS
Mood.create!(name: "Super happy")
Mood.create!(name: "Happy")
Mood.create!(name: "Sad")
Mood.create!(name: "Angry")

# RECIPES

Recipe.create!(name: "Pasta Carbonara")
Recipe.create!(name: "Gado Gado")
Recipe.create!(name: "Chicken cream")
Recipe.create!(name: "Fried Rice")



# FOOD ITEMS
puts "Creating food items..."

filepath = "db/data/ingredients.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  FoodItem.create!(name: row['ingredients'], id: row['id'])
  puts "#{row['ingredients']} #{row['id']}"
end
