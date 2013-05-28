class RepairController

    def index(vehicle_id)
      puts "type the ID number of vehicle to view its repairs"
      vehicle_id = gets.chomp
      matching_repairs = Repair.where(vehicle_id: vehicle_id).all
      puts "\nREPAIRS:\n"
      matching_repairs.each do |repair|
      puts "repair ID: #{repair.id}, date: #{repair.date}, repair: #{repair.repair_type}, cost: #{repair.cost}, mechanic: #{repair.mechanic}, mileage: #{repair.mileage}, notes: #{repair.notes}\n"
        end
  end

  def update
    puts "what repair would you like to update? type repair ID below"
    repair_id = gets.chomp
    puts "what would you like to update? type 'date', 'repair_type', 'cost', 'mileage', 'mechanic', 'notes'\n"
    attribute = gets.chomp
    puts "what would you like to change it to?"
    new_attribute = gets.chomp
    if attribute == "" or new_attribute == ""
      puts "one of the forms was blank.  please try again."
    else
    repair = Repair.find(repair_id)
    repair.update_column(attribute, new_attribute)
    puts "repair ID: #{repair.id}, date: #{repair.date}, repair: #{repair.repair_type}, cost: #{repair.cost}, mechanic: #{repair.mechanic}, mileage: #{repair.mileage}, notes: #{repair.notes}\n"
    puts "repair updated!"
    end
  end

  def delete(repair_id)
    Repair.delete(repair_id)
    puts "repair removed!"
  end

  def create
    puts "\n*all fields required*\ntype of repair? (we'll assign it to a vehicle at the end)"
    repair_type = gets.chomp
    puts "repair cost?\n"
    repair_cost = gets.chomp
    puts "what mechanic did you use?\n"
    mechanic = gets.chomp
    puts "date of the repair? YYYY/MM/DD\n"
    date_of_repair = gets.chomp
    puts "mileage on the vehicle at the time of the repair? (do not use commas)\n"
    mileage_at_time = gets.chomp
    puts "type any other notes that you would like to document the repair.\n"
    repair_notes = gets.chomp
    puts "which vehicle would you like to add a repair to?\n"
    v_controller = VehicleController.new
    v_controller.index
    puts "type the numeric ID of the vehicle that the repair is to be added to\n"
    vehicle_id = gets.chomp
    new_repair = Repair.new(repair_type: repair_type, cost: repair_cost, mechanic: mechanic,
    date: date_of_repair, mileage: mileage_at_time, notes: repair_notes,
    vehicle_id: vehicle_id)
      if new_repair.save
        puts "repair added!"
      else
        puts "Failure: #{new_repair.errors.full_messages.join(", ")}"
      end
  end

end