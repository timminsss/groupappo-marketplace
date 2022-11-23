# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'pry-byebug'
# CATEGORY_NAME = ["mountain bike", "road bike", "hybrid bike", "accessories"]
# PRODUCT_TYPE_NAME = %w[helmets shoes locks guards pumps stand straps lights]

# user = User.new(first_name: "first", last_name: "last", zip_code: "30678", email: "testeremail12356@outlook.com", password: "123456")
# # user.encrypted_password = '#$taawktljasktlw4aaglj'
# user.save!

# 100.times do
#   Product.create(user_id: 1, category: CATEGORY_NAME.sample, name: Faker::Name.name, description: Faker::Lorem.sentence, price: rand(50..100), image_url: "", product_type: PRODUCT_TYPE_NAME.sample)
# end
# Product::CATEGORY_NAME
# Creates 20 new users for the database

puts "Cleaning database"

User.destroy_all




puts "Creating new entries"

bike_category_images = {
  "mountain bike" => "https://d2yn9m4p3q9iyv.cloudfront.net/ghost/2020/sl-amr-4.7-al-u/thumbs/1000/d8151.jpeg",
  "road bike" => "https://archiv.cube.eu/_next/image?url=%2Fmedia%2F2021%2F476410%2F476410_light.jpg&w=3840&q=100",
  "hybrid bike" => "https://azwest1xfg344.blob.core.windows.net/azwesc1xfg346/thumbnail/9f/b5/8b/1667908877/S_0_60791_580055_S_00_1920x1920.jpg",
  "accessories" => "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/l/e/leatt-enduro-3.0-mtb-helmet-black-l1021010740-par.jpg"
}

# <<<<<<< HEAD
# alpha = ('a'..'z').to_a
# first_names = %w(Paul Starr Sebastien Eboni Korbin Marla Julissa Zion Junior Anton Keaton Tre Katie Davon Pamela Teagan Susana Damion Nestor Scott Katerina Javonte Emily Chelsey Jayna Neha Aden Madisyn Maura Reynaldo Jaylen Shayla Zachariah Michael Christin Rochelle Kaeli Salma Gianna Jose Fletcher Rose Felix Jaidyn Trevon Vicente Jared Treyton Anders Mohammed)
# last_names = %w(Devontae Chloe Abriana Barrett Roland Diana Devan Moses Keandre Geovanni Kavon Aaron Ariel Denver Jesse Lianna Frederick Starr Wade Aleena Jayvon Tatyana Stephon Lilianna Melinda Desirae Mikala Breanna Jovanni Weston Annemarie Brennen Alexandrea Caden Dandre Talia Phillip Houston Elisabeth Zachary Jaiden Terri Elexis Ahmed Allison Adrien Carina Yadira Moriah Monique)
# # GENERATING THE USERS
# puts "Seed started Generating the users"
# # DEFAULT USERS ARE GENERATED HERE
# # DEFAULT USERS ARE GENERATED HERE
# User.create(
#   first_name: "joh",
#   last_name: "doe",
#   zip_code: 12345,
#   email: "user1@example.com",
#   password: "password"
# )
# User.create(
#   first_name: "bruce",
#   last_name: "wayne",
#   zip_code: 12345,
#   email: "user2@example.com",
#   password: "password"
# )
# User.create(
#   first_name: "Jolene",
#   last_name: "sing",
#   zip_code: 12345,
#   email: "user3@example.com",
#   password: "password"
# )
# # DEFAULT USERS ARE GENERATED ABOVE HERE
# # DEFAULT USERS ARE GENERATED ABOVE HERE
# 20.times do
#   f_name = "#{first_names.sample}#{alpha.sample}"
#   l_name = "#{last_names.sample}#{alpha.sample}"
#   User.create(
#     first_name: "#{f_name}",
#     last_name: "#{l_name}",
#     zip_code: 12345,
#     email: "#{f_name}.#{l_name}@example.com",
#     password: "password"
# =======

owner = User.new(first_name: "John", last_name: "Doe", zip_code: 12345, email: "owner@example.com", password: "Pass1234")
owner.save

customer = User.new(first_name: "Harley", last_name: "Quin", zip_code: 12345, email: "customer@example.com", password: "Pass1234")
customer.save

puts "Users created"

2.times do
  category = Product::CATEGORY_NAME.sample
  product_image_url = bike_category_images[category]
  Product.create(
    user: owner,
    category: category,
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: rand(50..100),
    image_url: product_image_url,
    product_type: "bike"
  )
end

puts "Products created"

2.times do
  Booking.create(
    user: customer,
    start_date: DateTime.now,
    end_date: (DateTime.now + rand(1..5))
  )
end

puts "Bookings created"

Booking.all.each do |booking|
  ProductAssignment.create(
    product: Product.all.sample,
    booking: booking
  )
end

puts "Product assignments created"

# alpha = ('a'..'z').to_a
# first_names = %w(Paul Starr Sebastien Eboni Korbin Marla Julissa Zion Junior Anton Keaton Tre Katie Davon Pamela Teagan Susana Damion Nestor Scott Katerina Javonte Emily Chelsey Jayna Neha Aden Madisyn Maura Reynaldo Jaylen Shayla Zachariah Michael Christin Rochelle Kaeli Salma Gianna Jose Fletcher Rose Felix Jaidyn Trevon Vicente Jared Treyton Anders Mohammed)
# last_names = %w(Devontae Chloe Abriana Barrett Roland Diana Devan Moses Keandre Geovanni Kavon Aaron Ariel Denver Jesse Lianna Frederick Starr Wade Aleena Jayvon Tatyana Stephon Lilianna Melinda Desirae Mikala Breanna Jovanni Weston Annemarie Brennen Alexandrea Caden Dandre Talia Phillip Houston Elisabeth Zachary Jaiden Terri Elexis Ahmed Allison Adrien Carina Yadira Moriah Monique)
# # GENERATING THE USERS
# puts "Seed started Generating the users"
# 20.times do
#   f_name = "#{first_names.sample}#{alpha.sample}"
#   l_name = "#{last_names.sample}#{alpha.sample}"
#   User.create(
#     first_name: "#{f_name}",
#     last_name: "#{l_name}",
#     zip_code: 12345,
#     email: "#{f_name}.#{l_name}@example.com",
#     password: "password"
#   )
#   puts "Users Created name #{User.last.first_name} - #{User.last.last_name}"
#   puts "Users Created email #{User.last.email}"
#   puts "__________________________________________________"
# end
# puts "Users Created #{User.count}"
# sleep(2)
# # GENERATING THE PRODUCTS
# puts "Generating the products"
# users = User.first(5)
# users.each do |user|
#   10.times do
#     bike_category = Product::CATEGORY_NAME.sample
#     bike_url = bike_category_images[bike_category]
#     product_type_input = ""
#     if bike_category == "accessories"
#       product_type_input = Product::PRODUCT_TYPE_NAME.sample
#     else
#       product_type_input = "bike"
#     end
#     Product.create(
#       user_id: user.id,
#       category: bike_category,
#       name: Faker::Name.name,
#       description: Faker::Lorem.paragraph,
#       price: rand(50..100),
#       image_url: bike_url,
#       product_type: product_type_input
#     )
#     puts "#{Product.last.id}#{Product.last.user_id} - #{Product.last.category} - #{Product.last.name}"
#   end
# end
# puts "Products Created #{Product.count}"
# sleep(2)
# # GENERATING THE BOOKINGS
# puts "Generating the bookings"
# users_b = User.last(10)
# users_b.each do |user_b|
#   Booking.create(
#     user_id: user_b.id,
#     start_date: DateTime.now,
#     end_date: (DateTime.now + rand(1..5)),
#     price: 0,
#     booking_status: 0
#   )
#   puts "#{Booking.last.id} - #{Booking.last.user_id} - #{Booking.last.start_date} - #{Booking.last.end_date}"
# end
# puts "Bookings Created #{Booking.count}"
# sleep(2)
# # GENERATING THE PRODUCTASSIGNMENTSD
# puts "Generating the ProductAssignment"
# bookings = Booking.all
# products = Product.all
# bookings.each do |booking|
#   products.sample.id
#   ProductAssignment.create(
#     product_id: products.sample.id,
#     booking_id: booking.id
#   )
#   puts "#{ProductAssignment.last.id} - #{ProductAssignment.last.product_id} - #{ProductAssignment.last.booking_id}"
# end
# puts "ProductAssignment Created #{ProductAssignment.count}"
