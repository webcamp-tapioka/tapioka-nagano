class OneChangeOnUsers < ActiveRecord::Migration[5.2]
  def change
  	add_index :users, [:deleted_at, :datetime]
  end
end
