class LittleChangesOnSomeTables < ActiveRecord::Migration[5.2]
  def change
  	change_column :songs, :disc_number, :integer, null: false, default: 1
  end
end
