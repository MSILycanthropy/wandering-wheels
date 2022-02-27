class Car < ApplicationRecord
  broadcasts_to ->(_) { 'cars' }

  belongs_to :facility

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  validates :color, presence: true
  validates :car_type, presence: true
  validates :doors, presence: true
  validates :transmission, presence: true
  validates :license_plate, presence: true
  validates :rented, inclusion: { in: [true, false] }
  validates_length_of :license_plate, minimum: 5, maximum: 10
  validates :license_plate, uniqueness: { scope: :facility_id }
  validates :doors, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :mileage, numericality: { only_integer: true, greater_than: 0 }
  validates :year, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: Time.now.year + 3 }
end
