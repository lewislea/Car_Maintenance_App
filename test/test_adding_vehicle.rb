require_relative 'test_helper'

class TestAddingVehicle < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_saves_to_database
    assert_equal 0, Vehicle.count
    vehicle = Vehicle.new(make: "Honda", model: "Civic", year: 1986)
    vehicle.save!
    assert_equal 1, Vehicle.count
  end

  def test_add_new_vehicle_make
    vehicle = Vehicle.new(make: "Honda", model: "Civic", year: 1986)
    vehicle.save!
    assert_equal("Honda", vehicle.make)
  end

  def test_add_new_vehicle_model
    vehicle = Vehicle.new(make: "Honda", model: "Civic", year: 1986)
    vehicle.save!
    assert_equal("Civic", vehicle.model)
  end

  # def test_takes_arguments_and_uses_them
  #   `ruby futureperfect add foo`
  #   assert_equal 'foo', Project.last.name
  # end

  # def test_duplicate_names_are_ignored
  #   Project.create( name: 'foo' )
  #   original_project_count = Project.count
  #   `ruby futureperfect add foo`
  #   assert_equal original_project_count, Project.count
  # end

  # def test_duplicate_names_outputs_error_message
  #   Project.create( name: 'foo' )
  #   results = `ruby futureperfect add foo`
  #   assert results.include?('Name must be unique'), "Actually was '#{results}'"
  # end
end