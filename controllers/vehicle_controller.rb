class VehicleController

  def initialize
  end

  def index
    all_vehicles = Vehicle.all
    all_vehicles.each_with_index do |vehicle|
     puts "vehicle ID: #{vehicle.id} #{vehicle.year} #{vehicle.make} #{vehicle.model} mileage: #{vehicle.mileage}"
    end
  end


  def delete(vehicle_id)
      if Vehicle.delete(vehicle_id)
        Repair.where(:vehicle_id => vehicle_id).destroy_all
        puts "vehicle removed!"
      else
        puts "vehicle was not able to be removed"
      end
  end

end
