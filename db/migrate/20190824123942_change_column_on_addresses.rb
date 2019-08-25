class ChangeColumnOnAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :delivery_postal_code, :string, null: false
    remove_column :addresses, :prefecture_code
  end
end
