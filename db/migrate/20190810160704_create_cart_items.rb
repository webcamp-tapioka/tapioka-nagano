class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :product, foreign_key: true, null: false, index: true
      t.integer :product_amount, null: false

      t.timestamps
    end
  end
end
