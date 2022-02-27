# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

facility = Facility.create(name: "Tad's Rad Rides")

user = User.create(
  email: 'tadisrad@email.com',
  password: 'password',
  first_name: 'Tad',
  last_name: 'Tadderson',
  facility:
)

50.times do
  Car.create(
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    mileage: Faker::Vehicle.mileage,
    color: Faker::Vehicle.color,
    rented: false,
    car_type: Faker::Vehicle.car_type,
    doors: Faker::Vehicle.doors,
    transmission: Faker::Vehicle.transmission,
    license_plate: Faker::Vehicle.license_plate,
    facility:
  )
end

puts 'Finished'
puts 'Here is the login information:'
puts "Email: #{user.email}"
puts "Password: #{user.password}"
