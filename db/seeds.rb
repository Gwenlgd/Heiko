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
ReportFoodItem.destroy_all
ReportMood.destroy_all
ReportFeeling.destroy_all
Report.destroy_all
Mood.destroy_all
Recipe.destroy_all
User.destroy_all
FoodItem.destroy_all
Recipe.destroy_all
Feeling.destroy_all

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


# FOOD ITEMS
puts "Creating food items..."

filepath = "db/data/ingredients.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  FoodItem.create!(name: row['ingredients'], id: row['id'])
  puts "#{row['ingredients']} #{row['id']}"
end

# RECIPES

puts "Creating recipes..."

carbonara = Recipe.create!(name: "Pasta Carbonara")
bolognese = Recipe.create!(name: "Pasta Bolognese")
quinoa = Recipe.create!(name: "Quinoa salad")

# MOODS
["Super happy", "Happy", "Sad", "Anxious", "Stressed", "Angry", "Grumpy", "Annoyed"].each do |name|
  Mood.create!(name: name)
end

# SYMPTOMS

#["Energetic", "OK", "Tired", "No energy", "Bloated", "Stomach pain", "Gas", "Diarrhea", "Constipation", "Nausea", "Pimples", "Eczema", "Headache", "Asthma"].each do |name|
  #Feeling.create!(name: name)
#end

# CATEGORIES OF SYMPTOMS 14 total symptoms

# ENERGY CATEGORY 4 items
["Energetic", "Tired", "OK", "No energy"].each do |name|
feeling = Feeling.create!(category: "Energy",name: name)
end

# DIGESTION CATEGORY 6 items
["Bloated", "Stomach pain", "Gas", "Constipation"].each do |name|
Feeling.create!(category: "Digestion",name: name)
end


# SKIN CATEGORY 2 items
["Pimples", "Rash", "Sweating", "Dry skin"].each do |name|
Feeling.create!(category: "Skin",name: name)
end


# ILLNESS CATEGORY 2 items
["Headache", "Asthma", "Diarrhea", "Nausea"].each do |name|
Feeling.create!(category: "Illness",name: name)
end
