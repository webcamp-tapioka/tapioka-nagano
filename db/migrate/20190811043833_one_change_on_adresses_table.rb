class OneChangeOnAdressesTable < ActiveRecord::Migration[5.2]
  def change
  	change_column :addresses, :delivery_address_flag, :integer, null: false
  end
end
