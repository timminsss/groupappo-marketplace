# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

CATEGORY_NAME = ["mountain bike", "road bike", "hybrid bike", "accessories"]
PRODUCT_TYPE_NAME = %w[helmets shoes locks guards pumps stand straps lights]

user = User.new(first_name: "first", last_name: "last", zip_code: "30678", email: "testeremail12356@outlook.com", password: "123456")
# user.encrypted_password = '#$taawktljasktlw4aaglj'
user.save!

100.times do
  Product.create(user_id: 1, category: CATEGORY_NAME.sample, name: Faker::Name.name, description: Faker::Lorem.sentence, price: rand(50..100), image_url: "", product_type: PRODUCT_TYPE_NAME.sample)
end
