# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require "open-uri"
require "json"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
cocktail_serialized = open(url).read
cocktail_name = JSON.parse(cocktail_serialized)
cocktail_name['drinks'].each do |drink|
  ingredient_name = drink.values[0]
  Ingredient.create!(name: ingredient_name)
end

# puts "Destroy ingredients"
# Ingredient.destroy_all if Rails.env.development?

# puts "Destroy Cocktails"
# Cocktail.destroy_all if Rails.env.development?

# puts "Create ingredients"
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# ingredients = JSON.parse(open(url).read)
# ingredients["drinks"].each do |ingredient|
#   i = Ingredient.create(name: ingredient["strIngredient1"])
#   puts "create #{i.name}"
# end
