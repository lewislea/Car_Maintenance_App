class Repair < ActiveRecord::Base
  belongs_to :vehicle

  validates :repair_type, :mechanic, :cost, :date, :mileage, :vehicle_id, :presence => true
end