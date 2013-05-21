require_relative 'test_helper'

class TestAddingVehicle < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguments_and_saves_them
    assert_equal 0, Vehicle.count
    `ruby car.rb add Honda`
    assert_equal 1, Vehicle.count
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