class Vehicle < ActiveRecord::Base
  has_many :repairs

  validates :make, :model, :year, :mileage, :presence => true
end
