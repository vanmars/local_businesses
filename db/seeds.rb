# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_restaurants
    seed.generate_shops
  end

  def generate_restaurants
    50.times do |i|
      restaurant = Restaurant.create!(
        name: Faker::Restaurant.name,
        kind: Faker::Restaurant.type,
        description: Faker::Restaurant.description,
        review: Faker::Restaurant.review
      )
    end
    puts "50 restaurants successfully generated"
  end

  def generate_shops
    50.times do |i|
      shop = Shop.create!(
        name: Faker::Company.name,
        industry: Faker::Company.industry,
        logo_url: Faker::Company.logo,
        slogan: Faker::Company.catch_phrase
      )
    end
    puts "50 shops successfully generated"
  end
end

Seed.begin