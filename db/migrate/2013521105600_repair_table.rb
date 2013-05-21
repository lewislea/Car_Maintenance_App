class RepairTable < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :repair_type
      t.text :repair_notes
      t.string :mechanic
      t.integer :repair_cost
      t.date :date_of_repair
      t.integer :mileage_at_time_of_repair

      t.timestamps
    end
  end

end