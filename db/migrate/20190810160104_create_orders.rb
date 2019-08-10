class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.string :delivery_postal_code, null: false
      t.text :delivery_address, null: false
      t.string :delivery_name, null: false
      t.integer :postage, null: false
      t.integer :payment_method, null: false, default: 1
      t.integer :order_status_id, null: false, default: 1
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
