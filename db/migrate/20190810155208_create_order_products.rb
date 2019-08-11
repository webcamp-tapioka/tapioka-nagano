class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :order, foreign_key: true, null: false, index: true
      t.references :product, foreign_key: true, null: false, index: true
      t.integer :order_amount, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
