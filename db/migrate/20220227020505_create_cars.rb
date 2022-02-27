class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.string :color
      t.boolean :rented
      t.string :car_type
      t.integer :doors
      t.string :transmission
      t.string :license_plate
      t.belongs_to :facility, index: true

      t.timestamps
    end
  end
end
