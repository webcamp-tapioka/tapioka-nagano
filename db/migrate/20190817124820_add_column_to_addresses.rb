class AddColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :delivery_name_kana, :string
  end
end
