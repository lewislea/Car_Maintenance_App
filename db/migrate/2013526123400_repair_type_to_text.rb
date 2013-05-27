class RepairTypeToText < ActiveRecord::Migration
  def change
     change_column :repairs, :repair_type, :text
  end

end