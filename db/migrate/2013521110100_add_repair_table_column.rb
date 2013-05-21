class AddRepairTableColumn < ActiveRecord::Migration
  def change
     add_column :repairs, :vehicle_id, :integer
  end

end