require_relative 'test_helper'

class TestAddingRepair < MiniTest::Unit::TestCase
  include DatabaseCleaner

def test_saves_to_database
    assert_equal 0, Repair.count
    vehicle = Repair.new(type: "brakes", cost: 40, mechanic: "gary")
    vehicle.save!
    assert_equal 1, Repair.count
end

end
