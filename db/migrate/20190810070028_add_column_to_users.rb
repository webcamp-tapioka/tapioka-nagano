class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :first_name_kana, :string
  	add_column :users, :last_name_kana, :string
  	add_column :users, :phone_number, :string
  	add_column :users, :deleted_at, :datetime
  end
end
