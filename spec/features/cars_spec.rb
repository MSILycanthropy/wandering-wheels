require 'rails_helper'

RSpec.describe 'Cars', type: :feature do
  before(:each) do
    @facility = create(:facility)
    @user = create(:user, facility: @facility)
    sign_in @user

    @new_make = Faker::Vehicle.make
    @new_model = Faker::Vehicle.model
    @new_year = Faker::Vehicle.year
    @new_mileage = Faker::Vehicle.mileage
    @new_color = Faker::Vehicle.color
    @new_car_type = Faker::Vehicle.car_type
    @new_doors = Faker::Vehicle.doors
    @new_transmission = Faker::Vehicle.transmission
    @new_license_plate = Faker::Vehicle.license_plate
  end

  it 'edits a car' do
    @car = create(:car, facility: @facility)
    visit edit_car_path(@car)

    expect(page).to have_text('Edit Car')

    # fill in fields and submit
    fill_in 'Make', with: @new_make
    fill_in 'Model', with: @new_model
    fill_in 'Year', with: @new_year
    fill_in 'Mileage', with: @new_mileage
    fill_in 'Color', with: @new_color
    fill_in 'Car Type', with: @new_car_type
    fill_in 'Doors', with: @new_doors
    fill_in 'Transmission', with: @new_transmission
    fill_in 'License Plate', with: @new_license_plate
    check 'Rented'

    click_button 'Update'

    # check that the car was updated
    @car.reload
    expect(@car.make).to eq(@new_make)
    expect(@car.model).to eq(@new_model)
    expect(@car.year).to eq(@new_year)
    expect(@car.mileage).to eq(@new_mileage)
    expect(@car.color).to eq(@new_color)
    expect(@car.car_type).to eq(@new_car_type)
    expect(@car.doors).to eq(@new_doors)
    expect(@car.transmission).to eq(@new_transmission)
    expect(@car.license_plate).to eq(@new_license_plate)
    expect(@car.rented).to eq(true)
  end
end
