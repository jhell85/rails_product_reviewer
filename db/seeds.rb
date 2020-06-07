# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do
  product = Product.create!(
    name: Faker::Construction.material,
    country_of_orgin: Faker::Coffee.origin,
    cost: Faker::Number.within(range: 20..1000)
  )
  if product.persisted?
    rand(10..30).times do
      product.reviews.create!(
        author: Faker::Superhero.name,
        content_body: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false ),
        rating: rand(1..5)
      )
    end
  end
end

p "created #{Product.count} products & #{Review.count} reviews"