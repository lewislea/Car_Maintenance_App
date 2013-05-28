require_relative 'test_helper'

class TestAddingVehicle < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_saves_to_database
    assert_equal 0, Vehicle.count
    vehicle = Vehicle.new(make: "Honda", model: "Civic", year: 1986, mileage: 20)
    vehicle.save!
    assert_equal 1, Vehicle.count
  end

  def test_add_new_vehicle_make
    vehicle = Vehicle.new(make: "Honda", model: "Civic", year: 1986, mileage: 20)
    vehicle.save!
    assert_equal("Honda", vehicle.make)
  end

  def test_add_new_vehicle_model
    vehicle = Vehicle.new(make: "Honda", model: "Civic", year: 1986, mileage: 20)
    vehicle.save!
    assert_equal("Civic", vehicle.model)
  end

end