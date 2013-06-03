module Launch

  def command_list
   commands =  <<EOS
Welcome to the Car Maintenance App!
What would you like to do?
  - to add a car type "add vehicle"
  - to add a repair type "add repair"
  - to view a list of vehicles type "list vehicles"
EOS
  end

end