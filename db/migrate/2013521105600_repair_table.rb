class RepairTable < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.text :repair_type
      t.text :notes
      t.string :mechanic
      t.integer :cost
      t.date :date
      t.integer :mileage
      t.integer :vehicle_id

      t.timestamps
    end
  end

end