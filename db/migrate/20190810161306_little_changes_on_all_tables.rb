class LittleChangesOnAllTables < ActiveRecord::Migration[5.2]
  def change
  	change_column :admins, :name, :string, null: false
  	change_column :users, :first_name, :string, null: false
  	change_column :users, :last_name, :string, null: false
  	change_column :users, :first_name_kana, :string, null: false
  	change_column :users, :last_name_kana, :string, null: false
  	change_column :users, :phone_number, :string, null: false
  	change_column :users, :deleted_at, :datetime, index: true
  	remove_index :products, :label_id





  end
end
