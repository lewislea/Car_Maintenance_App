require_relative 'test_helper'

class TestAddingRepair < MiniTest::Unit::TestCase
  include DatabaseCleaner

def welcome_message
  "\nWelcome to the Vehicle Maintenance App!\n\nHere is a list of your vehicles.\n\n"
end

def test_add_repair
    shell_output = ""
    IO.popen('ruby car.rb', 'r+') do |pipe|
       #add-r to add vehcile
      pipe.puts("add-r")
      #repair type
      pipe.puts("oil change")
      #cost
      pipe.puts("")
      #mechanic
      pipe.puts("Gary")
      #date of repair
      pipe.puts("2010-4-5")
      #mileage at time of repair
      pipe.puts(23487)
      #other notes
      pipe.puts("none")
      #vehicle id of car repair is to be added to
      pipe.puts(4)
      #add another?
      pipe.puts("N")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, "\nWelcome to the Vehicle Maintenance App!\n\n
    Here is a list of your vehicles.\n\n*all fields required*\ntype of repair?
    (we'll assign it to a vehicle at the end)"    assert_includes shell_output, "repair cost?"
    assert_includes shell_output, "what mechanic did you use?"
    assert_includes shell_output, "date of the repair? YYYY/MM/DD"
    assert_includes shell_output, "mileage on the vehicle at the time of the repair? (do not use commas)"
    assert_includes shell_output, "type any other notes that you would like to document the repair."
    assert_includes shell_output, "which vehicle would you like to add a repair to?"
    assert_includes shell_output, "type the numeric ID of the vehicle that the repair is to be added to\n"
    assert_includes shell_output, "would you like to add another repair? type Y or N"
  end

  def test_blank_field_throws_exception
    shell_output = ""
    IO.popen('ruby car.rb', 'r+') do |pipe|
      #add-r to add vehcile
      pipe.puts("add-r")
      #repair type
      pipe.puts("oil change")
      #cost
      pipe.puts("")
      #mechanic
      pipe.puts("Gary")
      #date of repair
      pipe.puts("2010-4-5")
      #mileage at time of repair
      pipe.puts(23487)
      #other notes
      pipe.puts("none")
      #vehicle id of car repair is to be added to
      pipe.puts(4)
      #add another?
      pipe.puts("N")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, "\nWelcome to the Vehicle Maintenance App!\n\n
    Here is a list of your vehicles.\n\n*all fields required*\ntype of repair?
    (we'll assign it to a vehicle at the end)"
    assert_includes shell_output, "repair cost?"
    assert_includes shell_output, "what mechanic did you use?"
    assert_includes shell_output, "date of the repair? YYYY/MM/DD"
    assert_includes shell_output, "mileage on the vehicle at the time of the repair? (do not use commas)"
    assert_includes shell_output, "type any other notes that you would like to document the repair."
    assert_includes shell_output, "which vehicle would you like to add a repair to?"
    assert_includes shell_output, "Failure: Cost can't be blank"
    assert_includes shell_output, "would you like to add another repair? type Y or N"
  end

end
