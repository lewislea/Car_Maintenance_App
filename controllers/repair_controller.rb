class RepairController

    def index(vehicle_id)
    matching_repairs = Repair.where(vehicle_id: vehicle_id).all
    matching_repairs.each do |repair|
      puts "repair ID: #{repair.id}, date: #{repair.date}, repair: #{repair.repair_type}, cost: #{repair.cost}, mechanic: #{repair.mechanic}, mileage: #{repair.mileage}, notes: #{repair.notes}\n"
    end
  end

    def delete(repair_id)
    Repair.delete(repair_id)
      puts "repair removed!"
  end

end