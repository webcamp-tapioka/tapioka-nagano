class AddColumnToAdressesTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :addresses, :delivery_address_flag, :integer

  end
end
