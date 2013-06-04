require_relative 'test_helper'

class TestAddingVehicle < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def welcome_message
  "\nWelcome to the Vehicle Maintenance App!\n\nHere is a list of your vehicles.\n\n"
  end

   def test_add_vehicle
    shell_output = ""
    IO.popen('ruby car.rb', 'r+') do |pipe|
      #add-v to add vehcile
      pipe.puts("add-v")
      #make
      pipe.puts("Honda")
      #model
      pipe.puts("Accord")
      #year
      pipe.puts(2003)
      #mileage
      pipe.puts(39088)
      #purchased date
      pipe.puts("2009-4-5")
      #add another?
      pipe.puts("n")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, welcome_message
    assert_includes shell_output, "What is the make of the vehicle?"
    assert_includes shell_output, "What is the model of the vehicle"
    assert_includes shell_output, "What year was the vehicle made?"
    assert_includes shell_output, "How many miles are currently on the vehicle? (do not use commas)"
    assert_includes shell_output, "When did you purchase the vehicle? YYYY/MM/DD"
    assert_includes shell_output, "would you like to add another vehicle? type Y or N"
  end

  def test_blank_field_throws_exception
    shell_output = ""
    IO.popen('ruby car.rb', 'r+') do |pipe|
      #add-v to add vehcile
      pipe.puts("add-v")
      #make
      pipe.puts("Honda")
      #model
      pipe.puts("")
      #year
      pipe.puts(2003)
      #mileage
      pipe.puts(39088)
      #purchased date
      pipe.puts("2009-4-5")
      #add another?
      pipe.puts("n")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, welcome_message
    assert_includes shell_output, "What is the make of the vehicle?"
    assert_includes shell_output, "What is the model of the vehicle"
    assert_includes shell_output, "What year was the vehicle made?"
    assert_includes shell_output, "How many miles are currently on the vehicle? (do not use commas)"
    assert_includes shell_output, "When did you purchase the vehicle? YYYY/MM/DD"
    assert_includes shell_output, "Failure: Model can't be blank"
    assert_includes shell_output, "would you like to add another vehicle? type Y or N"
  end

end