class RenameRepairColumns < ActiveRecord::Migration
  def change
    change_table :repairs do |t|
      t.rename :repair_cost, :cost
      t.rename :repair_type,:type
      t.rename :mileage_at_time_of_repair, :mileage
      t.rename :date_of_repair, :date
      t.rename :repair_notes, :notes
    end
  end

end