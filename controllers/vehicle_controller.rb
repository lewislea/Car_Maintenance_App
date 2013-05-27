class VehicleController

  def initialize
  end

  def index_vehicle
    all_vehicles = Vehicle.all
    all_vehicles.each_with_index do |vehicle|
     puts "vehicle ID: #{vehicle.id} #{vehicle.year} #{vehicle.make} #{vehicle.model} mileage: #{vehicle.mileage}"
    end
  end

  def index_repairs(vehicle_id)
    matching_repairs = Repair.where(vehicle_id: vehicle_id).all
    matching_repairs.each do |repair|
      puts "repair ID: #{repair.id}, date: #{repair.date}, repair: #{repair.repair_type}, cost: #{repair.cost}, mechanic: #{repair.mechanic}, mileage: #{repair.mileage}, notes: #{repair.notes}\n"
    end
  end

  def delete_vehicle(vehicle_id)
      if Vehicle.delete(vehicle_id)
        Repair.where(:vehicle_id => vehicle_id).destroy_all
        puts "vehicle removed!"
      else
        puts "vehicle was not able to be removed"
      end
  end

  def delete_repair(repair_id)
    Repair.delete(repair_id)
      puts "repair removed!"
  end
end
