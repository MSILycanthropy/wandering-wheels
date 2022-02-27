FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    mileage { Faker::Vehicle.mileage }
    color { Faker::Vehicle.color }
    rented { false }
    car_type { Faker::Vehicle.car_type }
    doors { Faker::Vehicle.doors }
    transmission { Faker::Vehicle.transmission }
    license_plate { Faker::Vehicle.license_plate }

    facility
  end
end
