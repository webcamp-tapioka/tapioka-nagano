class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_name_kana, :string
  end
end
