class RenameTypeColumn < ActiveRecord::Migration
  def change
    change_table :repairs do |t|
      t.rename :type,:repair_type
    end
  end

end